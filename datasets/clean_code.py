import os
import pickle
import sys
import re
import json
from openai import OpenAI
import json
from formalize import formalize


def extract_decomposition(jsonl_file, name_to_extract):
    with open(jsonl_file, "r") as file:
        for line in file:
            record = json.loads(line)
            if record.get("name") == name_to_extract:
                return record["decomposition"]
    raise ValueError(f"No record found with name: {name_to_extract}")


# Initialize OpenAI client
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


# Clean and validate Lean code
def clean_code(raw_code: str) -> str:
    # Remove comments
    code_without_comments = re.sub(r"--.*$", "", raw_code, flags=re.MULTILINE)
    # Replace invalid escape sequences
    clean_code = re.sub(r"\\x[0-9A-Fa-f]{2}", "", code_without_comments)
    # Ensure no extra whitespace
    clean_code = clean_code.strip()
    return clean_code


def validate_lean_code(code: str) -> bool:
    # Basic validation for non-empty code
    return bool(code)


# Incremental Lean code generation with memory class
class LeanCodeMemory:
    def __init__(self):
        self.history = []

    def formalize_chunk(self, retrieved_chunk, system_prompt):
        """
        Formalize a single natural language chunk into Lean code.
        """
        formalization_prompt = f"""
        ### Instruction ###
        Convert the following natural language description into valid Lean code.
        Only output valid Lean code, no comments or extra text.

        Input: {retrieved_chunk}
        """
        return get_chat_completion(system_prompt, formalization_prompt)

    def merge_with_history(self, new_code, system_prompt):
        """
        Merge the new Lean code with the existing history.
        """
        if self.history:
            merge_prompt = f"""
            ### Instruction ###
            Combine the following Lean code incrementally.
            Only output valid Lean code, no comments or extra text.

            Current Code: {self.history[-1]}
            New Code: {new_code}
            """
            return get_chat_completion(system_prompt, merge_prompt)
        else:
            return new_code

    def update_memory(self, retrieved_chunk, system_prompt):
        """
        Update the memory with the new retrieved chunk by formalizing and merging it into the existing Lean code.
        """
        # Formalize the new chunk
        formalized_code = self.formalize_chunk(retrieved_chunk, system_prompt)

        # Clean and validate the formalized Lean code
        cleaned_code = clean_code(formalized_code)
        if not validate_lean_code(cleaned_code):
            raise ValueError(f"Invalid Lean code formalized: {cleaned_code}")

        # Merge the cleaned code with history
        updated_code = self.merge_with_history(cleaned_code, system_prompt)

        # Clean and validate the merged Lean code
        cleaned_merged_code = clean_code(updated_code)
        if validate_lean_code(cleaned_merged_code):
            self.history.append(cleaned_merged_code)
        else:
            raise ValueError(f"Invalid Lean code merged: {cleaned_merged_code}")

        return cleaned_merged_code

    def get_full_code(self):
        """
        Return the full Lean code as the latest state in memory.
        """
        return self.history[-1] if self.history else ""

    def get_history(self):
        """
        Return the history of Lean code generation.
        """
        return self.history


# Main function
def main():
    # System prompt to guide the model
    system_prompt = """
    You are an assistant tasked with converting natural language into valid Lean code. 
    Follow the instructions carefully, and ensure that your response only contains valid Lean code.
    """

    # File path for proofnet_decomposed.jsonl
    jsonl_file = (
        "/Users/zhongkaiwen/Desktop/strict-llm/datasets/proofnet_decomposed.jsonl"
    )

    # Name of the target example to extract
    target_name = "exercise_1_13a"

    # Extract decomposition
    decomposition_chunks = extract_decomposition(jsonl_file, target_name)

    # Initialize the code generator
    memory = LeanCodeMemory()

    try:
        for chunk in decomposition_chunks:
            memory.update_memory(chunk, system_prompt)

        # Get the full Lean code
        full_code = memory.get_full_code()
        print("Generated Full Lean Code:\n")
        print(full_code)

        # Optional: View generation history
        print("\nGeneration History:\n")
        for idx, code in enumerate(memory.get_history()):
            print(f"Step {idx + 1}:\n{code}\n")

    except ValueError as e:
        print(f"Error during Lean code generation: {e}")


if __name__ == "__main__":
    main()
