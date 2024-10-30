import tempfile
import subprocess
import re
import logging

# Configure logging
logging.basicConfig(level=logging.DEBUG, format="%(levelname)s:%(message)s")


def get_lean_code(input_data):
    if input_data.endswith(".lean"):
        with open(input_data, "r") as file:
            return file.read()
    else:
        return input_data


def compile_lean_code(lean_code):
    with tempfile.NamedTemporaryFile(
        mode="w", suffix=".lean", delete=False
    ) as temp_file:
        temp_file.write(lean_code)
        temp_file_path = temp_file.name

    try:
        # Run Lean compiler without --json flag
        result = subprocess.run(
            ["lean", temp_file_path],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
        )
        return result.stdout, result.stderr, result.returncode
    except Exception as e:
        return "", f"Compilation failed: {e}", 1


def parse_compiler_output(stdout, stderr, returncode):
    combined_output = stdout + "\n" + stderr
    lines = combined_output.split("\n")
    errors = []
    error_pattern = re.compile(
        r"(?P<file>.+?):(?P<line>\d+):(?P<column>\d+): error: (?P<message>.+)"
    )

    current_error = None
    collecting_details = False

    for line in lines:
        error_match = error_pattern.match(line)
        if error_match:
            # If there's an existing error being collected, append it before starting a new one
            if current_error:
                errors.append(current_error)
            # Initialize a new error entry
            current_error = {
                "file": error_match.group("file"),
                "line": error_match.group("line"),
                "column": error_match.group("column"),
                "message": error_match.group("message"),
                "details": [],
            }
            collecting_details = True  # Start collecting details for this error
        elif collecting_details:
            if line.strip() == "":
                # Blank line signals end of error details
                collecting_details = False
                if current_error:
                    errors.append(current_error)
                    current_error = None
            else:
                # Append the line to the current error's details
                current_error["details"].append(line.strip())

    # Append the last error if it exists
    if current_error:
        errors.append(current_error)

    # Check for errors
    if returncode != 0 or errors:
        return {"status": "error", "errors": errors}

    # Check for goals
    goal_pattern = re.compile(r"the goal is (.+)")
    goals = goal_pattern.findall(combined_output)
    if goals:
        return {"status": "goal", "goals": goals}

    return {"status": "success"}


def translate_to_informal(parsed_output):
    status = parsed_output["status"]
    if status == "success":
        return "The Lean code compiled successfully without any errors."
    elif status == "error":
        error_messages = []
        for error in parsed_output["errors"]:
            details = "\n    ".join(error["details"]) if error["details"] else ""
            error_messages.append(
                f"- {error['file']}:{error['line']}:{error['column']}: {error['message']}\n    {details}"
            )
        return f"Compilation failed with the following errors:\n" + "\n".join(
            error_messages
        )
    elif status == "goal":
        goals = "\n".join([f"- {goal}" for goal in parsed_output["goals"]])
        return f"The compiler encountered the following goals:\n{goals}"
    else:
        return "Unknown compiler status."


def process_lean_input(input_data):
    lean_code = get_lean_code(input_data)
    stdout, stderr, returncode = compile_lean_code(lean_code)

    # Debugging: Log stdout and stderr
    logging.debug("=== Compiler STDOUT ===")
    logging.debug(stdout)
    logging.debug("======================")
    logging.debug("=== Compiler STDERR ===")
    logging.debug(stderr)
    logging.debug("======================")

    parsed_output = parse_compiler_output(stdout, stderr, returncode)
    informal_description = translate_to_informal(parsed_output)
    return informal_description


if __name__ == "__main__":
    # Example Lean code with intentional errors
    lean_code_with_error = """
theorem add_comm (a b : Nat) : a + b = b + a := by
  induction b with
  | zero =>
    rw [Nat.add_zero, Nat.zero_add]
  | succ d hd =>
    rw [Nat.add_succ, hd, Nat.succ_add]

    """

    result = process_lean_input(lean_code_with_error)
    print(result)
