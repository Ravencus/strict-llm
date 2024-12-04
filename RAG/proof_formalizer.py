'''
This package aims to formalize proofs in natural language into LEAN code.
The main characteristic of proof is that it's a series of tactics applied to a proof state.
A knowledge base of what each tactic does could be very helpful.
Also, knowing what tactics are frequently used together could be helpful.
The knowledge base could be built using the FormalisingMathematics2024 course.
Every successful proof in the course is a good example, and can be added to the knowledge base.
How to remove duplicates could be a potential problem: 
maybe building a tactic based knowledge base and treating the duplicates as examples in the prompt?

Main issue: lacking informal proofs for each example in the course.
Potential solution 1: manually write some informal proofs for the examples in the course.
Potential solution 2: informalize using llm for proved examples.
'''

'''
Also, for each complete proof, obtaining the correct answer is the only goal for formalization.
However, in order to learn from the proof, correctness might not be the best way to go.
What should be learned might better be the proof state transition, along with all the wrong/redundant paths.
The proof state, unfortunately, is not trackable. In order to mitigate this,
we apply the following variational strategy:
1. record the proof state of applying each tactic.
2. we start from each intermediate proof state, and ask the LLM if there are other possible ways.
3. follow some of the possible ways along the line, WE DON'T KNOW WHAT EXACTLY COMES NEXT!
'''

import os
import sys
import tempfile
import shutil
from deprecated import deprecated
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from lean_cmd_exec import execute_lean_files

class ProofState:
    def __init__(self):
        self.hypotheses = []  # List of hypothesis strings
        self.goals = []       # List of goal strings
        
    def __str__(self):
        """String representation of the proof state showing hypotheses and goals."""
        output = []
        if self.hypotheses:
            output.append("Hypotheses:")
            for hyp in self.hypotheses:
                output.append(f"  {hyp}")
        if self.goals:
            output.append("Goals:")
            for goal in self.goals:
                output.append(f"  ⊢ {goal}")
        return "\n".join(output) if output else "Empty proof state"
        
    def parse_from_string(self, compiler_output: str):
        """Parse proof state from Lean compiler output string.
        
        Args:
            compiler_output: String containing Lean compiler output
            
        The output format looks like:
        unsolved goals
        case h
        ε : ℝ 
        hε : 0 < ε
        ⊢ ∀ (n : ℕ), 100 ≤ n → |37 - 37| < ε
        """
        lines = compiler_output.splitlines()
        
        # Find start of proof state
        start_idx = -1
        for i, line in enumerate(lines):
            if "unsolved goals" in line:
                start_idx = i + 1
                break
                
        if start_idx == -1:
            return
            
        # Parse hypotheses and goals
        in_goals = False
        for line in lines[start_idx:]:
            line = line.strip()
            if not line:
                continue
                
            if line.startswith("⊢"):
                in_goals = True
                self.goals.append(line[1:].strip())
            elif not in_goals:
                self.hypotheses.append(line.strip())
class FormalTheorem:
    def __init__(self, name: str):
        self.name = name
        self.background = ""  # Background definitions and imports
        self.statement = ""   # The theorem statement
        self.tactics = []     # List of tactics applied
        self.initial_state = ""  # Starting proof state
        self.proof_states = [] # List of proof states after each tactic
        self.categories = []    # List of categories associated with the theorem
        self.set_options = ["set_option linter.unusedVariables false\n\n"]  # List of set_option commands
        
    def from_lean_file(self, lean_file: str):
        """Initialize a FormalTheorem from a Lean source file.
        
        Args:
            lean_file: Path to the Lean file containing the theorem or example
        """
        with open(lean_file, 'r') as f:
            lines = f.readlines()
            
        # Extract background and target sections
        background = []
        target = []
        in_background = False
        in_target = False
        
        for line in lines:
            if '-- begin background' in line:
                in_background = True
                continue
            if '-- end background' in line:
                in_background = False
                continue
            if '-- begin target' in line:
                in_target = True
                continue
            if '-- end target' in line:
                in_target = False
                continue
                
            if in_background:
                background.append(line)
            if in_target:
                target.append(line)
                
        self.background = ''.join(background)
        
        # Extract theorem/example name and statement
        found_name = False
        for line in target:
            if 'theorem' in line:
                parts = line.split(':', 1)  # Split on first colon only
                if len(parts) >= 2:
                    self.name = parts[0].replace('theorem', '').strip()
                    self.statement = line.strip()  # Store entire line
                    found_name = True
                break
            elif 'example' in line:
                # Use filename as name for examples
                self.name = os.path.splitext(os.path.basename(lean_file))[0]
                self.statement = line.strip()  # Store entire line
                found_name = True
                break
                
        if not found_name:
            # Fallback to filename if no theorem/example found
            self.name = os.path.splitext(os.path.basename(lean_file))[0]
            self.statement = ""
                
        # Extract tactics from proof block
        tactics = []
        in_proof = False
        for line in target:
            if 'by' in line:
                in_proof = True
                continue
            if in_proof and line.strip():
                tactics.append(line.strip())
                
        self.tactics = tactics
        
        # we build a temporary file, starting from background, set_options, and statement
        # and then build a series of files, each adding one tactic
        # use execute_lean_files to execute these files and get the outputs
        # Build and execute files incrementally
        current_tactics = []
        lean_files = []
        temp_dir = tempfile.mkdtemp()

        try:
            # Get initial proof state before any tactics
            initial_lean_file = os.path.join(temp_dir, 'step_0.lean')
            with open(initial_lean_file, 'w') as f:
                f.write(self.background)
                f.write('\n')
                # Write each set_option on a new line
                for opt in self.set_options:
                    f.write(f'{opt}\n')
                f.write('\n')
                f.write(self.statement)  # Statement already includes 'by'
                f.write('\n')
            
            # Execute initial file and store state
            initial_result = execute_lean_files([initial_lean_file])[0]
            (file_path, output, exit_code) = initial_result
            initial_state = ProofState()
            initial_state.parse_from_string(output)
            self.initial_state = initial_state
            
            
            # Build temporary lean files
            for i, tactic in enumerate(self.tactics, 1):
                # Create lean file with background + statement + tactics so far
                lean_file = os.path.join(temp_dir, f'step_{i}.lean')
                with open(lean_file, 'w') as f:
                    f.write(self.background)
                    f.write('\n')
                    # Write each set_option on a new line
                    for opt in self.set_options:
                        f.write(f'{opt}\n')
                    f.write('\n')
                    f.write(self.statement)
                    f.write('\n')
                    for t in current_tactics + [tactic]:
                        f.write(f'  {t}\n')
                
                lean_files.append(lean_file)
                current_tactics.append(tactic)

            # Execute all files and store outputs
            results = execute_lean_files(lean_files)
            for i, (file_path, output, exit_code) in enumerate(results, 1):
                # Create ProofState object from compiler output
                step_result = ProofState()
                step_result.parse_from_string(output)
                self.proof_states.append(step_result)
                
        finally:
            # Clean up temporary directory and files
            shutil.rmtree(temp_dir)

    def generate_rich_proof_content(self, proof_nl: str) -> str:
        """Generate rich content combining natural language proof with formal proof states.
        
        Args:
            proof_nl: Natural language proof text
            
        Returns:
            String containing interleaved natural language proof steps, tactics, and proof states
        """
        pass
class Theorem:
    def __init__(self, formal_theorem: FormalTheorem, statement_nl: str, proof_nl: str):
        """Initialize a Theorem object.
        
        Args:
            formal_theorem: FormalTheorem object containing the formal statement and proof
            statement_nl: Natural language statement of the theorem
            proof_nl: Natural language proof of the theorem
        """
        self.formal_theorem = formal_theorem
        self.statement_nl = statement_nl 
        self.proof_nl = proof_nl




@deprecated
def theorem_analyzer(proof_trace_file: str, output_path: str = '.'):
    """Analyzes a proof trace file and creates step-by-step files showing proof progress.
    
    Args:
        proof_trace_file: Path to the x_proof_trace.lean file
        output_path: Path where the stepped_ folder will be created. Defaults to current directory.
        
    The function:
    1. Reads the proof trace file
    2. Extracts background and target blocks
    3. For the target proof, creates incremental files showing each step
    4. Stores files in a new directory named after the theorem
    """
    # Read the proof trace file
    with open(proof_trace_file, 'r') as f:
        lines = f.readlines()
    
    # Extract background block
    background = []
    in_background = False
    for line in lines:
        if '-- begin background' in line:
            in_background = True
            continue
        if '-- end background' in line:
            in_background = False
            continue
        if in_background:
            background.append(line)
            
    # Extract target block and proof
    target = []
    proof_lines = []
    in_target = False
    in_proof = False
    for line in lines:
        if '-- begin target' in line:
            in_target = True
            continue
        if '-- end target' in line:
            in_target = False
            continue
        if in_target:
            target.append(line)
            if 'by' in line:
                in_proof = True
                continue
            if in_proof:
                proof_lines.append(line)
                
    # Create directory for output files
    
    # Get base name of proof trace file without extension
    base_name = os.path.splitext(os.path.basename(proof_trace_file))[0]
    output_dir = os.path.join(output_path, 'stepped_' + base_name)
    os.makedirs(output_dir, exist_ok=True)
    # Create full.lean with original content
    with open(os.path.join(output_dir, 'full.lean'), 'w') as f:
        # Write background
        f.writelines(background)
        
        f.write("set_option linter.unusedVariables false\n\n")
        # Write target theorem and full proof
        f.writelines(target)
    
    # Create incremental proof files
    lean_output_dir = os.path.join(output_dir, f'stepped_lean_{base_name}')
    os.makedirs(lean_output_dir, exist_ok=True)
    
    for i in range(len(proof_lines)+1):
        with open(os.path.join(lean_output_dir, f'step_{i}.lean'), 'w') as f:
            # Write linter option at start of file
            
            # Write background
            f.writelines(background)
            
            f.write("set_option linter.unusedVariables false\n\n")
            # Write target theorem
            f.writelines([l for l in target if l not in proof_lines])
            # Write proof steps up to current index
            f.writelines(proof_lines[:i])
            
    # Execute all intermediate files and store results
    step_files = [os.path.join(lean_output_dir, f'step_{i}.lean') for i in range(len(proof_lines)+1)]
    results = execute_lean_files(step_files)
    
    # Create execution trace directory
    exec_trace_dir = os.path.join(output_dir, f'exec_trace_{base_name}')
    os.makedirs(exec_trace_dir, exist_ok=True)
    
    # Write results to individual files for each step
    for i, (file_path, output, exit_code) in enumerate(results):
        result_file = os.path.join(exec_trace_dir, f'step_{i}.txt')
        with open(result_file, 'w') as f:
            f.write(f'Step {i}:\n')
            f.write(f'File: {file_path}\n') 
            f.write(f'Output:\n{output}\n')
            f.write(f'Exit Code: {exit_code}\n')





if __name__ == '__main__':
    # theorem_analyzer('test/test_proof_trace.lean', 'test_result')
    test_theorem = FormalTheorem('test_theorem')
    test_theorem.from_lean_file('test/test_proof_trace.lean')