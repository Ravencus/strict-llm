# contains api for executing lean files in parallel through CMD
# expecting: success(no compiler errors), error with descriptions
# to run lean with mathlib4, use:
# lake env lean file_name.lean
# sourced from https://proofassistants.stackexchange.com/questions/2526/how-to-run-lean4-with-mathlib-manually
# however, this requires Mathlib in the same directory as the file to be executed, i.e., execute in mathlib4/

# otherwise, use https://github.com/leanprover-community/mathlib4/wiki/Using-mathlib4-as-a-dependency

def mathlib_runtime_prep():
    """
    Prepares the mathlib runtime environment by creating a Lean project if needed.
    Creates a mathlib_runtime directory and initializes it with mathlib4 if it doesn't exist.
    """
    import os
    import subprocess

    if not os.path.exists('mathlib_runtime'):
        # Create new mathlib project
        subprocess.run(['lake', '+leanprover-community/mathlib4:lean-toolchain', 'new', 'mathlib_runtime', 'math'])
        
        # Get lake cache
        os.chdir('mathlib_runtime')
        subprocess.run(['lake', 'exe', 'cache', 'get'])
        os.chdir('..')


def execute_lean_files(file_paths: list[str]) -> list[tuple[str, str, int]]:
    """
    Execute multiple Lean files in parallel and return their compilation results.
    
    Args:
        file_paths: List of paths to Lean files to execute
        
    Returns:
        List of tuples containing:
        - Original file path
        - Compiler output message
        - Exit code (0 for success, non-zero for failure)
    """
    import subprocess
    import shutil
    import os
    
    # Prepare mathlib runtime environment
    mathlib_runtime_prep()
    
    results = []
    for file_path in file_paths:
        # Copy file to mathlib runtime directory
        runtime_file = os.path.join('mathlib_runtime', os.path.basename(file_path))
        shutil.copy2(file_path, runtime_file)
        
        try:
            # Execute lean in mathlib runtime directory
            os.chdir('mathlib_runtime')
            process = subprocess.run(['lake', 'env', 'lean', os.path.basename(file_path)],
                                  capture_output=True,
                                  text=True)
            os.chdir('..')
            
            # Get output and return code
            output = process.stdout if process.stdout else process.stderr
            exit_code = process.returncode
            
            results.append((file_path, output.strip(), exit_code))
            
        finally:
            # Cleanup copied file
            if os.path.exists(runtime_file):
                os.remove(runtime_file)
            
    return results

def diff_paired_lean_files(file1: str, file2: str) -> tuple[str, str, tuple[tuple[str, str, int], tuple[str, str, int]]]:
    """
    Compare two Lean files and execute them, returning the differences and execution results.
    
    Args:
        file1: Path to original Lean file
        file2: Path to modified Lean file with additions
        
    Returns:
        Tuple containing:
        - Original file contents as string
        - Added content as string 
        - Tuple of execution results for both files, each containing:
          (file path, compiler output, exit code)
    """
    # Read both files
    with open(file1, 'r') as f1, open(file2, 'r') as f2:
        content1 = f1.read()
        content2 = f2.read()
    
    # Find additions by comparing lines
    lines1 = content1.splitlines()
    lines2 = content2.splitlines()
    
    added = []
    i = j = 0
    while i < len(lines2):
        if j >= len(lines1):
            # Remaining lines in file2 are all additions
            added.extend(lines2[i:])
            break
            
        if lines2[i] != lines1[j]:
            # Lines differ - show the change
            added.append(f"-{lines1[j]}\n+{lines2[i]}")
            i += 1
            j += 1
        else:
            # Lines match - advance both counters
            i += 1
            j += 1
            
    added_content = '\n'.join(added)
    
    # Execute both files
    results = execute_lean_files([file1, file2])
    
    return (content1, added_content, (results[0], results[1]))

# tests
def test_execute_lean_files():
    results = execute_lean_files(["test/test_1.lean", "test/test_2.lean", "test/test_3.lean"])
    for result in results:
        file_path, output, code = result
        print(f"File: {file_path}\nOutput: {output}\nExit Code: {code}\n")

def test_diff_paired_lean_files():
    result = diff_paired_lean_files("test/test_1.lean", "test/test_2.lean")
    original, changes, (result1, result2) = result
    print(f"Original content:\n{original}\n")
    print(f"Changes:\n{changes}\n") 
    print(f"First file result: {result1}")
    print(f"Second file result: {result2}")

if __name__ == "__main__":
    # mathlib_runtime_prep()
    test_execute_lean_files()
    # test_diff_paired_lean_files()
    pass