"""
statement_formalizer.py

This package provides:
- a RAG building tool extracting atomic pairs of (natural language math object, formalized LEAN code)
- a formalizer to transform a natural language math statement into a formalized LEAN code
"""

import json
from openai import OpenAI
import os
import sys
from typing import Dict
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from datasets.parser import parse_jsonl



from dotenv import load_dotenv
# Load environment variables from .env file
load_dotenv()
# Get OpenAI API key from environment variable
api_key = os.getenv('OPENAI_API_KEY')
if not api_key:
    raise ValueError("OPENAI_API_KEY not found in environment variables")

# Initialize OpenAI client with API key
os.environ["OPENAI_API_KEY"] = api_key


# system_prompt = """You will be provided with two statements: an "informal_prefix" and a "formal_statement". The "informal_prefix" contains a natural language math statement, and the "formal_statement" contains a LEAN code representation of that statement. Each () in the LEAN code represents a math concept or expression in the natural language statement. Your task is to find all the correspondence for () in "formal_statement".
# An example is as follows:
# example user input:
# {"informal_prefix": "/-- Suppose $E\\subset\\mathbb{R}^k$ is uncountable, and let $P$ be the set of condensation points of $E$. Prove that $P$ is perfect.-/\\n", "formal_statement": "theorem exercise_2_27a (k : ℕ) (E P : Set (EuclideanSpace ℝ (Fin k)))\\n  (hE : E.Nonempty ∧ ¬ Set.Countable E)\\n  (hP : P = {x | ∀ U ∈ 𝓝 x, ¬ Set.Countable (P ∩ E)}) :\\n  IsClosed P ∧ P = {x | ClusterPt x (𝓟 P)} :="}
# example output:
# {"pairs": [("$E\\subset\\mathbb{R}^k$", "(E P : Set (EuclideanSpace ℝ (Fin k)))"),("uncountable", "(hE : E.Nonempty ∧ ¬ Set.Countable E)"),("let $P$ be the set of condensation points of $E$","(hP : P = {x | ∀ U ∈ 𝓝 x, ¬ Set.Countable (P ∩ E)})"),("Prove that $P$ is perfect","IsClosed P ∧ P = {x | ClusterPt x (𝓟 P)}")]}"
# """

# user_prompt = """{"informal_prefix": "/-- Let $\Omega$ be a bounded open subset of $\mathbb{C}$, and $\varphi: \Omega \rightarrow \Omega$ a holomorphic function. Prove that if there exists a point $z_{0} \in \Omega$ such that $\varphi\left(z_{0}\right)=z_{0} \quad \text { and } \quad \varphi^{\prime}\left(z_{0}\right)=1$ then $\varphi$ is linear.-/", "formal_statement": "theorem exercise_2_9
#   {f : ℂ → ℂ} (Ω : Set ℂ) (b : Bornology.IsBounded Ω) (h : IsOpen Ω)
#   (hf : DifferentiableOn ℂ f Ω) (z : Ω) (hz : f z = z) (h'z : deriv f z = 1) :
#   ∃ (f_lin : ℂ →L[ℂ] ℂ), ∀ x ∈ Ω, f x = f_lin x :="}
# """

system_prompt = """ You will first be provided with a natural language math statement. Then you will be provided with a list of hypotheses, and a goal, written in LEAN code. Your task is to find the correspondence between formal hypotheses and the components of the natural language statement, as well as the formal goal. Note that one component of the natural language statement may correspond to multiple formal hypotheses, and vice versa.
An example is as follows:

example user input:
math statement: "/-- Suppose $E\\subset\\mathbb{R}^k$ is uncountable, and let $P$ be the set of condensation points of $E$. Prove that $P$ is perfect.-/\\n"
hypotheses: ["(k : ℕ)", "(E P : Set (EuclideanSpace ℝ (Fin k)))", "(hE : E.Nonempty ∧ ¬ Set.Countable E)", "(hP : P = {x | ∀ U ∈ 𝓝 x, ¬ Set.Countable (P ∩ E)})"]
goal: "IsClosed P ∧ P = {x | ClusterPt x (𝓟 P)}"

example output:
{
    "$E\\subset\\mathbb{R}^k$" : ["(k : ℕ)", "(E P : Set (EuclideanSpace ℝ (Fin k)))"],
    "Suppose $E\\subset\\mathbb{R}^k$ is uncountable" : ["(hE : E.Nonempty ∧ ¬ Set.Countable E)"],
    "let $P$ be the set of condensation points of $E$" : ["(hP : P = {x | ∀ U ∈ 𝓝 x, ¬ Set.Countable (P ∩ E)})"],
    "Prove that $P$ is perfect" : ["IsClosed P ∧ P = {x | ClusterPt x (𝓟 P)}"]
}
"""

user_prompt = """
math statement: "/-- Let $\Omega$ be a bounded open subset of $\mathbb{C}$, and $\varphi: \Omega \rightarrow \Omega$ a holomorphic function. Prove that if there exists a point $z_{0} \in \Omega$ such that $\varphi\left(z_{0}\right)=z_{0} \quad \text { and } \quad \varphi^{\prime}\left(z_{0}\right)=1$ then $\varphi$ is linear.-/"
hypotheses: ["{f : ℂ → ℂ}", "(Ω : Set ℂ)", "(b : Bornology.IsBounded Ω)", "(h : IsOpen Ω)", "(hf : DifferentiableOn ℂ f Ω)", "(z : Ω)", "(hz : f z = z)", "(h'z : deriv f z = 1)"]
goal: "∃ (f_lin : ℂ →L[ℂ] ℂ), ∀ x ∈ Ω, f x = f_lin x"
"""



def parse_formal_statement(statement: str) -> Dict:
    """Parse a formal statement into its components.
    
    Args:
        statement: A string containing a formal Lean theorem statement
        
    Returns:
        Dictionary containing:
        - theorem_name: Name of the theorem
        - hypotheses: List of hypothesis strings (including brackets)
        - goal: The goal expression
    """
    # Split on first space to get theorem name
    parts = statement.split(maxsplit=1)
    if len(parts) < 2 or (parts[0] != "theorem" and parts[0] != "def"):
        print(f"Invalid statement format: {statement}")
        raise ValueError("Statement must start with 'theorem' or 'def'")
        
    remainder = parts[1]

    # Find all potential name end positions
    candidates = []
    if remainder.find(" ") != -1:
        candidates.append(remainder.find(" "))
    if remainder.find("(") != -1:  
        candidates.append(remainder.find("("))
    if remainder.find("[") != -1:
        candidates.append(remainder.find("["))
    if remainder.find("{") != -1:
        candidates.append(remainder.find("{"))
    
    # Filter out -1 values and get minimum
    candidates = [c for c in candidates if c != -1]
    if not candidates:
        raise ValueError("Could not find theorem name end position")
        
    name_end = min(candidates)
    if name_end == -1:
        raise ValueError("Could not find theorem name")
    
    theorem_name = remainder[:name_end]
    remainder = remainder[name_end:].strip()
    
    # Parse hypotheses up to the goal
    hypotheses = []
    stack = []
    start = 0
    
    for i, char in enumerate(remainder):
        if char in "([{":
            if not stack:
                start = i
            stack.append(char)
        elif char in ")]}":
            if stack:
                opening = stack.pop()
                if not stack:  # Complete bracket pair found
                    hypotheses.append(remainder[start:i+1])
        elif char == ":" and not stack:
            goal = remainder[i:].strip()
            if goal.endswith(":= by"):
                goal = goal[1:-6].strip()  # Remove ":" prefix and ":= by" suffix
            elif goal.endswith(":="):
                goal = goal[1:-2].strip()  # Remove ":" prefix and ":=" suffix
            break
            
    return {
        "theorem_name": theorem_name,
        "hypotheses": hypotheses,
        "goal": goal
    }

# # Example usage:
# example = "theorem exercise_1_1_16 {G : Type*} [Group G]\n  (x : G) (hx : x ^ 2 = 1) :\n  orderOf x = 1 ∨ orderOf x = 2 :="
# example = "theorem conjugate.mul_mem (hy : y ∈ {a : G | ∃ h, h ∈ H ∧ a = x * h * x⁻¹}) (hz : z ∈ {a : G | ∃ h, h ∈ H ∧ a = x * h * x⁻¹}) : y * z ∈ {a : G | ∃ h, h ∈ H ∧ a = x * h * x⁻¹} := by"
# result = parse_formal_statement(example)
# print(result)

def entry_to_user_prompt(informal_prefix: str, formal_statement: str) -> str:
    """
    Transform a formal statement into example user prompt using parse_formal_statement.
    """
    parsed = parse_formal_statement(formal_statement)
    return f"math statement: {informal_prefix}\nhypotheses: {parsed['hypotheses']}\ngoal: {parsed['goal']}"

def test_entry_prompt():
    test = entry_to_user_prompt("/-- Suppose $U$ is a subspace of $V$. Prove that $U^{\\perp}=\\{0\\}$ if and only if $U=V$-/\n", "theorem exercise_6_16 {K V : Type*} [RCLike K] [NormedAddCommGroup V] [InnerProductSpace K V]\n  {U : Submodule K V} :\n  U.orthogonal = ⊥  ↔ U = ⊤ :=")
    print(test)


def get_chat_completion(system_prompt: str, user_prompt: str, max_tokens: int = 256):

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

def print_another_chat_completion():
    user_prompt = entry_to_user_prompt("/-- Suppose $U$ is a subspace of $V$. Prove that $U^{\\perp}=\\{0\\}$ if and only if $U=V$-/\n", "theorem exercise_6_16 {K V : Type*} [RCLike K] [NormedAddCommGroup V] [InnerProductSpace K V]\n  {U : Submodule K V} :\n  U.orthogonal = ⊥  ↔ U = ⊤ :=")
    test = get_chat_completion(system_prompt, user_prompt)
    print(repr(test.choices[0].message.content))
    
# print_another_chat_completion()

def print_chat_completion():
    
    test = get_chat_completion(system_prompt, user_prompt)
    print(repr(test.choices[0].message.content)) # this repr prints without the unicode escape characters
    # however, "\\" is introduced and should be further dealt with
    


# TODO: response postprocessing
def post_process_llm_response(response: str) -> dict:
    """
    Process LLM response to extract clean dictionary by manually finding matched pairs.
    
    Args:
        response: Raw LLM response string containing dictionary-like structure
        
    Returns:
        Clean dictionary with extracted key-value pairs
    """
    # Find the outermost {} pair
    start_brace = response.find("{")
    end_brace = response.rfind("}")
    if start_brace == -1 or end_brace == -1:
        raise ValueError("No valid dictionary structure found in response")
        
    dict_content = response[start_brace:end_brace+1]
    result_dict = {}
    
    # Track position while parsing
    pos = 1  # Skip first {
    while pos < len(dict_content)-1:  # Stop before final }
        # Skip whitespace
        while pos < len(dict_content) and dict_content[pos].isspace():
            pos += 1
            
        # Find key
        if dict_content[pos] == '"':
            key_start = pos + 1
            pos += 1
            while pos < len(dict_content) and dict_content[pos] != '"':
                pos += 1
            key = dict_content[key_start:pos]
            pos += 1
            
            # Skip to colon
            while pos < len(dict_content) and dict_content[pos] != ':':
                pos += 1
            pos += 1
            
            # Skip whitespace
            while pos < len(dict_content) and dict_content[pos].isspace():
                pos += 1
                
            # Parse value
            if dict_content[pos] == '[':
                # List value
                bracket_count = 1
                value_start = pos
                pos += 1
                while pos < len(dict_content) and bracket_count > 0:
                    if dict_content[pos] == '[':
                        bracket_count += 1
                    elif dict_content[pos] == ']':
                        bracket_count -= 1
                    pos += 1
                value = dict_content[value_start:pos]
                # Replace \x0b with \v in key string
                key = key.replace('\x0b', '\\v')
                
                result_dict[key] = value
            
            # Skip comma
            while pos < len(dict_content) and dict_content[pos] != ',':
                pos += 1
            pos += 1
        else:
            pos += 1
    
    return result_dict

# test = get_chat_completion(system_prompt, user_prompt)
# print(repr(post_process_llm_response(test.choices[0].message.content)))

def build_proofnet_doc():
    """Build proofnet document by extracting informal_prefix and formal_statement from proofnet dataset,
    constructing user prompts, and writing to a new jsonl file.
    """
    # Get absolute path relative to this file
    current_dir = os.path.dirname(os.path.abspath(__file__))
    input_path = os.path.join(current_dir, "..", "datasets", "proofnet.jsonl")
    output_path = os.path.join(current_dir, "..", "datasets", "proofnet_prompt.jsonl")
    
    # Read proofnet dataset
    entries = parse_jsonl(input_path)
    
    # Process each entry
    processed_entries = []
    for entry in entries:

        try:
            # Convert entry to dict if needed
            entry_dict = entry if isinstance(entry, dict) else entry.__dict__
 
            # Extract informal_prefix and formal_statement
            informal_prefix = entry_dict["informal_prefix"]
            formal_statement = entry_dict["formal_statement"]
            print(informal_prefix)
            print(formal_statement)
            # Construct user prompt
            user_prompt = entry_to_user_prompt(informal_prefix, formal_statement)
            
            # Add prompt to entry
            entry_dict["user_prompt"] = user_prompt
            print(entry_dict["user_prompt"])
            processed_entries.append(entry_dict)
            
        except Exception as e:
            name = entry_dict["name"] if isinstance(entry, dict) else entry.name
            print(f"Failed to process entry: {name}")
            print(f"Error: {str(e)}")
            continue
    
    # Write processed entries to new file
    with open(output_path, "w") as f:
        for entry in processed_entries:
            f.write(json.dumps(entry) + "\n")
            
    print(f"Successfully processed {len(processed_entries)} entries")

# build_proofnet_doc()

def build_minif2f_doc():
    """Build minif2f document by extracting informal_prefix and formal_statement from minif2f dataset,
    constructing user prompts, and writing to a new jsonl file.
    """
    # Get absolute path relative to this file
    current_dir = os.path.dirname(os.path.abspath(__file__))
    input_path = os.path.join(current_dir, "..", "datasets", "minif2f.jsonl") 
    output_path = os.path.join(current_dir, "..", "datasets", "minif2f_prompt.jsonl")
    
    # Read minif2f dataset
    entries = parse_jsonl(input_path)
    
    # Process each entry
    processed_entries = []
    for entry in entries:
        try:
            # Convert entry to dict if needed
            entry_dict = entry if isinstance(entry, dict) else entry.__dict__
            
            # Extract informal_prefix and formal_statement
            informal_prefix = entry_dict["informal_prefix"]
            formal_statement = entry_dict["formal_statement"]
            print(informal_prefix)
            print(formal_statement)
            
            # Construct user prompt
            user_prompt = entry_to_user_prompt(informal_prefix, formal_statement)
            
            # Add prompt to entry
            entry_dict["user_prompt"] = user_prompt
            print(entry_dict["user_prompt"])
            processed_entries.append(entry_dict)
            
        except Exception as e:
            name = entry_dict["name"] if isinstance(entry, dict) else entry.name
            print(f"Failed to process entry: {name}")
            print(f"Error: {str(e)}")
            continue
    
    # Write processed entries to new file
    with open(output_path, "w") as f:
        for entry in processed_entries:
            f.write(json.dumps(entry) + "\n")
            
    print(f"Successfully processed {len(processed_entries)} entries")


build_minif2f_doc()

# TODO: not every trail is valid, we propose a iterative approach to find the best decomposition that can recover the original statement.
def iterative_decomposition():
    pass

# def process_dataset(dataset_path: str, save_path: str):
#     entries = parse_jsonl(dataset_path)
#     total = len(entries)
#     for i, entry in enumerate(entries):
#         print(f"Processing entry {i+1}/{total}...")
#         response = get_chat_completion(system_prompt, entry.informal_prefix, max_tokens=1024)
#         with open(save_path, 'a') as f:
#             json_obj = {
#                 "name": entry.name,
#                 "response": response.choices[0].message.content,
#                 "header": entry.header
#             }
#             f.write(json.dumps(json_obj) + "\n")
#         print(f"Completed {i+1}/{total} entries ({((i+1)/total)*100:.1f}%)")

# process_dataset("../datasets/proofnet.jsonl", "../datasets/proofnet_RAG.jsonl")

# def read_rag_dataset(dataset_path: str):
#     entries = []
#     with open(dataset_path, 'r') as f:
#         for line in f:
#             entry = json.loads(line)
#             entries.append(entry)
#     return entries

# print(read_rag_dataset("../datasets/proofnet_RAG.jsonl")[0]["response"])

# def text_to_pairs(text: str) -> dict:
#     """
#     Transform a text string containing pairs into a dictionary.
    
#     Args:
#         text: String in format {"pairs": [(informal1, formal1), (informal2, formal2), ...]}
    
#     Returns:
#         Dictionary mapping informal statements to formal statements
#     """
#     # Extract content between square brackets
#     start = text.find("[")
#     end = text.rfind("]")
#     pairs_text = text[start+1:end]
    
#     # Split into individual pair strings
#     pair_strings = pairs_text.split("),")
    
#     # Parse each pair string into tuple
#     pairs_dict = {}
#     for pair in pair_strings:
#         # Clean up string and extract informal/formal parts
#         pair = pair.strip(" ()")
#         informal_end = pair.find('",')
#         informal = pair[pair.find('"')+1:informal_end].strip()
#         formal = pair[informal_end+4:-1].strip()
#         # Remove " :=" from end of formal statements if present
#         if formal.endswith(" :="):
#             formal = formal[:-3]
#         pairs_dict[informal] = formal
        

        
#     return pairs_dict

# def build_rag_dict(dataset_path: str) -> dict:
#     """
#     Build a dictionary mapping exercise names to their informal/formal statement pairs.
    
#     Args:
#         dataset_path: Path to the RAG dataset JSON file
        
#     Returns:
#         Dictionary mapping exercise names to dictionaries of informal->formal pairs
#     """
#     rag_dict = {}
#     entries = read_rag_dataset(dataset_path)
    
#     for entry in entries:
#         name = entry["name"]
#         response = entry["response"]
#         try:
#             pairs = text_to_pairs(response)
#             rag_dict[name] = pairs
#         except:
#             print(f"Failed to process entry: {name}")
#             continue
            
#     return rag_dict


if __name__ == "__main__":
    # import json
    # from pathlib import Path
    
    # # Read and parse the proofnet dataset
    # dataset_path = "../datasets/proofnet.jsonl"
    # output_path = "../datasets/proofnet_parsed.jsonl"
    
    # parsed_statements = []
    # with open(dataset_path, 'r') as f:
    #     for line in f:
    #         entry = json.loads(line)
    #         try:
    #             parsed = parse_formal_statement(entry['formal_statement'])
    #             entry['parsed_formal'] = parsed
    #             parsed_statements.append(entry)
    #         except Exception as e:
    #             print(f"Failed to parse statement: {entry.get('id', 'unknown')}")
    #             print(f"Error: {str(e)}")
    #             continue
    
    # # Save parsed results
    # with open(output_path, 'w') as f:
    #     for entry in parsed_statements:
    #         f.write(json.dumps(entry) + '\n')
            
    # print(f"Successfully parsed and saved {len(parsed_statements)} statements to {output_path}")
    pass