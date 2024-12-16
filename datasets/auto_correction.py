import re
from openai import OpenAI
from typing import List, Tuple
from evaluation_metrics import is_correct_output
from lean_cmd_exec import execute_lean_files


def get_chat_completion(system_prompt: str, user_prompt: str, max_tokens: int = 1024):
    client = OpenAI()
    response = client.chat.completions.create(
        model="gpt-4o",
        messages=[
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": user_prompt},
        ],
        temperature=0.01,
        max_tokens=max_tokens,
        top_p=1,
    )
    return response.choices[0].message.content


class LeanCodeMemory:
    def __init__(self):
        self.history = []


def extract_lean(response_text):
    """Extract the Lean part from the response and remove unwanted trailing parts."""
    start_marker = "```lean"
    end_marker = "```"
    unwanted_trailing = r":=\s*begin\s*-- proof goes here\s*end"
    start = response_text.find(start_marker)
    end = response_text.find(end_marker, start + len(start_marker))
    if start != -1 and end != -1:
        extracted = response_text[start + len(start_marker) : end].strip()
        # Remove unwanted trailing part using regex
        extracted = re.sub(unwanted_trailing, "", extracted).strip()
        return extracted
    return response_text.strip()


def autocorrect_lean_code(extracted_lean: str, output: str, memory: LeanCodeMemory):
    """
    Automatically correct Lean code by interacting with GPT and retrying compilation.

    Args:
        extracted_lean: The initial Lean code extracted.
        output: The compiler feedback for the Lean code.
        memory: The LeanCodeMemory object to store history.

    Returns:
        Final corrected Lean code and its compiler output.
    """
    system_prompt = "You are a Lean theorem prover assistant. Help fix Lean code based on compiler feedback."
    corrected_code = extracted_lean
    max_iterations = 3

    for _ in range(max_iterations):
        # Add current state to memory
        memory.history.append({"lean_code": corrected_code, "compiler_output": output})

        # Generate user prompt
        history_prompt = "\n\n".join(
            [
                f"Attempt {_ + 1}:\nLean Code:\n{entry['lean_code']}\nCompiler Feedback:\n{entry['compiler_output']}"
                for _, entry in enumerate(memory.history)
            ]
        )
        user_prompt = f"{history_prompt}\n\nPlease fix the Lean code."
        # print(user_prompt)

        # Get new Lean code from GPT
        response = get_chat_completion(system_prompt, user_prompt)
        corrected_code = extract_lean(response)
        # print("------")
        # print(corrected_code)
        # print("//////")

        # Save corrected code to a temporary file
        temp_file = "temp.lean"
        with open(temp_file, "w", encoding="utf-8") as file:
            file.write(corrected_code)

        # Execute the corrected Lean file
        compilation_results = execute_lean_files([temp_file])
        output = compilation_results[0][1]

        # Check if the code compiles successfully
        if is_correct_output(output):
            return corrected_code, output

    # Return the final attempt if all iterations fail
    return corrected_code, output


if __name__ == "__main__":
    # Test the autocorrect functionality
    initial_code = "theorem constant_if_im_constant {f : ℂ → ℂ} (Ω : Set ℂ) (h : IsOpen Ω) (hf : DifferentiableOn ℂ f Ω) (hc : ∃ (c : ℝ), ∀ z ∈ Ω, (f z).im = c) : ∀ a b ∈ Ω, f a = f b := by\ndone"
    initial_output = "test_1.lean:8:148: error: unexpected token '∈'; expected ','"
    memory = LeanCodeMemory()

    corrected_code, final_output = autocorrect_lean_code(
        initial_code, initial_output, memory
    )

    print("Corrected Code:")
    print(corrected_code)
    print("\nFinal Compiler Output:")
    print(final_output)
    # results = execute_lean_files(
    #     [
    #         "proofnet_lean_files/test_24.lean",
    #     ]
    # )
    # for result in results:
    #     file_path, output, code = result
    #     print(f"File: {file_path}\nOutput: {output}\nExit Code: {code}\n")
