import os
import pickle
import sys
import json
from openai import OpenAI
def get_chat_completion(system_prompt: str, user_prompt: str, max_tokens: int = 1024):

    client = OpenAI()
    response = client.chat.completions.create(
        model="gpt-4o",
        messages=[
            {
                "role": "system",
                "content": system_prompt
            },
            {
                "role": "user",
                "content": user_prompt
            }
        ],
        temperature=0.001,
        max_tokens=max_tokens,
        top_p=1
    )
    return response

# Add parent directory to path to allow importing datasets module
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

def post_process(response):
    # Remove lines starting with "`" from response
    lines = response.split('\n')
    filtered_lines = [line for line in lines if not line.strip().startswith('`')]
    return '\n'.join(filtered_lines)
    

def statement_decompose(statement: str):
    """
    Query LLM to decompose a math statement into several segments.
    """
    pass

def formalize(entry):
    
    current_dir = os.path.dirname(os.path.abspath(__file__))
    log_path = os.path.join(current_dir, "log.json")
    log_entry = {
        "name": entry["object"].name,
        "nl_full": entry["object"].informal_prefix,
        "fl_ref_full": entry["object"].formal_statement
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
    # Write log entry to log.json
    try:
        # Read existing log if file exists
        if os.path.exists(log_path):
            with open(log_path, 'r') as f:
                log_data = json.load(f)
        else:
            log_data = []
            
        # Append new entry
        log_data.append(log_entry)
        
        # Write updated log
        with open(log_path, 'w') as f:
            json.dump(log_data, f, indent=2)
            
    except Exception as e:
        print(f"Error writing to log file: {e}")
        
    return response.choices[0].message.content.strip()
    
    
def test_formalize():
    current_dir = os.path.dirname(os.path.abspath(__file__))
    pickle_path = os.path.join(current_dir, "proofnet_decomposed_statement_test.pkl")

    with open(pickle_path, "rb") as f:
        entries = pickle.load(f)
    # Process first 5 entries
    for i, entry in enumerate(entries[35:]):
        print(f"\nProcessing entry {i+1}:")
        fl_statement = formalize(entry)
        print(f"Formalized: {fl_statement}")

test_formalize()



def step_by_step_formalize(entry):
    """Convert an entry to a prompt for formalization.
    
    Args:
        entry: Dictionary containing entry data
        
    Returns:
        String containing the formatted prompt
    """
    # Create log file
    current_dir = os.path.dirname(os.path.abspath(__file__))
    log_path = os.path.join(current_dir, "log.json")
    
    
    
    # First extract all keys from the entry
    keys = list(entry["decomposition_result"].keys())

    print(entry["object"].informal_prefix)
    log_name = entry["object"].name
    log_nl_full = entry["object"].informal_prefix
    log_fl_ref_full = entry["object"].formal_statement

    # create a log entry in json for this entry
    log_entry = {
        "name": log_name,
        "nl_full": log_nl_full,
        "fl_ref_full": log_fl_ref_full
    }
    # Add keys to log entry
    log_entry["keys"] = keys
    
    
    
    system_prompt = f"""
    You are a formalizer for Lean. You are given several chunks of a natural language statement.
    For each chunk, a similar chunk is provided by a RAG system, along with a formalized version of the chunk in LEAN code.
    You need to translate each chunk into Lean code by learning from the provided examples, while maintaining the consistency of the original statement.    
    """
    nl_statement = ""
    fl_statement = ""
    
    
    
    # Extract top_k_results for each key and get first element
    for key in keys:
        top_k_results = entry["decomposition_result"][key]["top_k_results"]
        if not top_k_results:
            print(f"No results found for {key}")
            with open(log_path, "a") as f:
                f.write(f"No results found for {key}\n")
        else:
            # construct the user prompt
            user_prompt = ""

            
            # Convert matched_decompose from string representation to actual list
            try:
                matched_decompose = eval(top_k_results[0]["matched_decompose"])
            except:
                # Fallback if eval fails - assume empty list
                matched_decompose = []
                with open(log_path, "a") as f:
                    f.write(f"Failed to eval matched_decompose for key {key}\n")
            
            # Concatenate matched_decompose list into a single string
            matched_decompose = " ".join(matched_decompose) if matched_decompose else ""

            user_prompt += f"""
            Here's a related example of formalizing a math statement segment into Lean code that might be helpful:
            natural language statement: "{top_k_results[0]["matched_key"]}"
            formalized Lean code: "{matched_decompose}"
            
            The preceding math statement is: "{nl_statement}" and it has already been formalized.
            Generate the formalized Lean code for the current math statement segment: "{key}"
            Output the code only, no other text.
            The generated code should be a continuation from: "{fl_statement}"
            """
            # Log the prompt
            with open(log_path, "a") as f:
                f.write(f"\nPrompt for key {key}:\n{user_prompt}\n")
            
            nl_statement += key
            
            # Get LLM response for the prompt
            response = get_chat_completion(system_prompt, user_prompt)
            post_processed_response = post_process(response.choices[0].message.content.strip())
            
            # Log the response
            with open(log_path, "a") as f:
                f.write(f"\nResponse for key {key}:\n{post_processed_response}\n")

                
            # Extract just the Lean code from response
            if key == keys[-1]:
                fl_statement += " : " + post_processed_response + " := "
            else:
                fl_statement += post_processed_response

    return fl_statement
    



def read_minif2f_decomposed():
    """
    Read and print entries from minif2f_decomposed_statement_test.pkl
    """
    current_dir = os.path.dirname(os.path.abspath(__file__))
    pickle_path = os.path.join(current_dir, "minif2f_decomposed_statement_test.pkl")
    
    with open(pickle_path, "rb") as f:
        entries = pickle.load(f)
        with open("fl_minif2f", "w") as f:
            total = len(entries)
            for i, entry in enumerate(entries):
                fl_statement = formalize(entry)
                f.write(fl_statement + "\n")
                print(f"Completed {i+1}/{total} entries ({((i+1)/total)*100:.1f}%)")
            
def read_proofnet_decomposed():
    current_dir = os.path.dirname(os.path.abspath(__file__))
    pickle_path = os.path.join(current_dir, "proofnet_decomposed_statement_test.pkl")
    with open(pickle_path, "rb") as f:
        entries = pickle.load(f)
        with open("fl_proofnet", "w") as f:
            total = len(entries)
            for i, entry in enumerate(entries):
                fl_statement = formalize(entry)
                f.write(fl_statement + "\n")
                print(f"Completed {i+1}/{total} entries ({((i+1)/total)*100:.1f}%)")
            
        

if __name__ == "__main__":
    # current_dir = os.path.dirname(os.path.abspath(__file__))
    # pickle_path = os.path.join(current_dir, "minif2f_decomposed_statement_test.pkl")
    
    # with open(pickle_path, "rb") as f:
    #     entries = pickle.load(f)
    #     if entries:
    #         print(entries[0]["decomposition_result"])
    pass