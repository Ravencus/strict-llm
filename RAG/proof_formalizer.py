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

def tactic_analysis(formal_theorem: FormalTheorem):
    """Analyze the effect of each tactic by comparing proof states before and after.
    
    Args:
        formal_theorem: FormalTheorem instance containing tactics and proof states
    """
    # Get initial state
    prev_state = formal_theorem.initial_state
    
    system_prompt = """
    You are a proof state analyzer.
    You are given a tactic and the proof state before and after applying the tactic.
    You need to analyze the effect of the tactic on the proof state.
    The description of the effect should be abstract and general.
    An example is given below.
    user input:
    tactic:
    proof state before applying the tactic:
    proof state after applying the tactic:
    example output:
    """
    
    user_prompt = """
    tactic:
    proof state before applying the tactic:
    proof state after applying the tactic:
    """
    
    # For each tactic, get its proof state and previous state
    for i, tactic in enumerate(formal_theorem.tactics):
        current_state = formal_theorem.proof_states[i]
        print(f"Tactic: {tactic}")
        print(f"Previous state:\n{prev_state}")
        print(f"Current state:\n{current_state}\n")
        prev_state = current_state
        # TODO: get the LLM response



if __name__ == '__main__':

    test_theorem = FormalTheorem('test_theorem')
    test_theorem.from_lean_file('test/test_proof_trace.lean')
    tactic_analysis(test_theorem)