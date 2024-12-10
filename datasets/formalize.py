import os
import pickle
import sys
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
        temperature=0.01,
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
    

def formalize(entry):
    """Convert an entry to a prompt for formalization.
    
    Args:
        entry: Dictionary containing entry data
        
    Returns:
        String containing the formatted prompt
    """
    # First extract all keys from the entry
    keys = list(entry["decomposition_result"].keys())
    
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
        else:
            # construct the user prompt
            user_prompt = ""
            user_prompt += f"""
            what we have so far:
            natural language statement: {nl_statement}
            formal language statement: {fl_statement}
            """
            
            # Convert matched_decompose from string representation to actual list
            try:
                matched_decompose = eval(top_k_results[0]["matched_decompose"])
            except:
                # Fallback if eval fails - assume empty list
                matched_decompose = []
            
            # Concatenate matched_decompose list into a single string
            matched_decompose = " ".join(matched_decompose) if matched_decompose else ""
            
            user_prompt += f"""
            here is a similar example for the incoming task:
            natural language chunk: {top_k_results[0]["matched_key"]}
            and it's formalized to be: {matched_decompose}
            """


            user_prompt += f"""
            now we want to formalize the following natural language statement into LEAN code: {key}
            formalize based on the example, and return the corresponding LEAN code only, no other text.
            """
            
            nl_statement += key
            
            # Get LLM response for the prompt
            response = get_chat_completion(system_prompt, user_prompt)
            post_processed_response = post_process(response.choices[0].message.content.strip())
            # Extract just the Lean code from response
            if key == keys[-1]:
                fl_statement += " : " + post_processed_response + " := "
            else:
                fl_statement += post_processed_response
            # print(nl_statement)
            # print(fl_statement)
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
    read_proofnet_decomposed()