import os
import pickle
import sys
from openai import OpenAI
import re


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
    return response


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


# Add parent directory to path to allow importing datasets module
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))


def post_process(response):
    # Remove lines starting with "`" from response
    lines = response.split("\n")
    filtered_lines = [line for line in lines if not line.strip().startswith("`")]
    return "\n".join(filtered_lines)


def formalize(entry):

    current_dir = os.path.dirname(os.path.abspath(__file__))
    log_path = os.path.join(current_dir, "log.json")
    log_entry = {
        "name": entry["object"].name,
        "nl_full": entry["object"].informal_prefix,
        "fl_ref_full": entry["object"].formal_statement,
    }
    keys = list(entry["decomposition_result"].keys())

    log_entry["keys"] = keys
    system_prompt = f"""
    You are a formalizer for Lean. You will be given a natural language math statement, and several examples of how similar statements or segments of statements have been formalized.
    you are to formalize the given statement into Lean code by learning from the examples.
    An structure of the input and output is provided below:
    Input:
        Statement to be formalized: ...
        Related Examples:
            Example: "" has been formalized to be: ""
            Example: "" has been formalized to be: ""
            ...
    Output:
        theorem name : "statement_to_be_formalized" := by
    """

    user_prompt = f"""
    Statement to be formalized: {entry["object"].informal_prefix}
    Related Examples:
    """
    # Add examples from decomposition results
    for key in keys:
        top_k_results = entry["decomposition_result"][key]["top_k_results"]
        matched_decompose = eval(top_k_results[0]["matched_decompose"])
        matched_decompose = " ".join(matched_decompose) if matched_decompose else ""
        user_prompt += f"""
        Example: "{key}" has been formalized to be: "{matched_decompose}"
        """
    log_entry["user_prompt"] = user_prompt
    response = get_chat_completion(system_prompt, user_prompt)
    log_entry["response"] = response.choices[0].message.content.strip()

    return extract_lean(response.choices[0].message.content.strip())


# def read_proofnet_decomposed():
#     current_dir = os.path.dirname(os.path.abspath(__file__))
#     pickle_path = os.path.join(current_dir, "proofnet_decomposed_statement_test.pkl")
#     with open(pickle_path, "rb") as f:
#         entries = pickle.load(f)

#         if entries:
#             fl_statement = formalize(entries[104])
#             print(entries[104])

#             with open("fl_proofnet_test", "w") as f:
#                 f.write(fl_statement + "\n")
#                 print("Processed 1/1 entry (100.0%)")
#         else:
#             print("No entries found in the pickle file.")


def read_proofnet_decomposed():
    current_dir = os.path.dirname(os.path.abspath(__file__))
    pickle_path = os.path.join(current_dir, "proofnet_decomposed_statement_test.pkl")

    try:
        with open(pickle_path, "rb") as f:
            entries = pickle.load(f)

            if entries:
                # Locate the specific entry by name
                target_key = "exercise_1_4"
                target_entry = next(
                    (
                        entry
                        for entry in entries
                        if "object" in entry
                        and hasattr(entry["object"], "name")
                        and entry["object"].name == target_key
                    ),
                    None,
                )

                if target_entry:
                    print(f"Found entry with name: {target_entry['object'].name}")
                    fl_statement = formalize(target_entry)
                    print(target_entry)

                    with open("fl_proofnet_test", "w") as output_file:
                        output_file.write(fl_statement + "\n")
                        print("Processed entry: {target_key}")
                else:
                    print(f"Entry with name '{target_key}' not found.")
            else:
                print("No entries found in the pickle file.")
    except FileNotFoundError:
        print(
            "Pickle file not found. Please ensure the file exists at the specified path."
        )
    except KeyError as e:
        print(f"KeyError: {e}. Please verify the structure of the entries.")
    except AttributeError as e:
        print(f"AttributeError: {e}. Please verify the object structure.")
    except Exception as e:
        print(f"An error occurred: {e}")


if __name__ == "__main__":
    read_proofnet_decomposed()
