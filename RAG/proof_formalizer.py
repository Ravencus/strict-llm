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
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from lean_cmd_exec import execute_lean_files



def theorem_analyzer(proof_trace_file: str):
    """Analyzes a proof trace file and creates step-by-step files showing proof progress.
    
    Args:
        proof_trace_file: Path to the x_proof_trace.lean file
        
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
    output_dir = 'stepped_' + base_name
    os.makedirs(output_dir, exist_ok=True)
    
    # Create incremental proof files
    for i in range(len(proof_lines)+1):
        with open(f'{output_dir}/step_{i}.lean', 'w') as f:
            # Write linter option at start of file
            
            # Write background
            f.writelines(background)
            
            f.write("set_option linter.unusedVariables false\n\n")
            # Write target theorem
            f.writelines([l for l in target if l not in proof_lines])
            # Write proof steps up to current index
            f.writelines(proof_lines[:i])
            
    # Execute all intermediate files and store results
    step_files = [f'{output_dir}/step_{i}.lean' for i in range(len(proof_lines)+1)]
    results = execute_lean_files(step_files)
    
    # Write results to individual files for each step
    for i, (file_path, output, exit_code) in enumerate(results):
        result_file = f'{output_dir}/step_{i}_result.txt'
        with open(result_file, 'w') as f:
            f.write(f'Step {i}:\n')
            f.write(f'File: {file_path}\n') 
            f.write(f'Output:\n{output}\n')
            f.write(f'Exit Code: {exit_code}\n')
            
if __name__ == '__main__':
    theorem_analyzer('test/test_proof_trace.lean')