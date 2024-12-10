import json
from dataclasses import dataclass
from typing import Optional

@dataclass
class ProofNetEntry:
    name: str
    split: str
    informal_prefix: str
    formal_statement: str
    goal: str
    header: Optional[str] = None

@dataclass
class ProofNetEntryDecomposed:
    name: str
    split: str
    informal_prefix: str
    formal_statement: str
    goal: str
    user_prompt: str
    decomposition: dict
    header: Optional[str] = None

def parse_jsonl(file_path: str):
    """Parse a .jsonl file and return list of ProofNetEntry objects.
    
    Args:
        file_path: Path to .jsonl file
        
    Returns:
        List of ProofNetEntry objects containing parsed data
    """
    entries = []
    with open(file_path, 'r') as f:
        for line in f:
            if line.strip():  # Skip empty lines
                data = json.loads(line)
                entry = ProofNetEntry(
                    name=data['name'],
                    split=data['split'],
                    informal_prefix=data['informal_prefix'],
                    formal_statement=data['formal_statement'], 
                    goal=data['goal'],
                    header=data.get('header')  # Optional field
                )
                entries.append(entry)
    return entries

def parse_jsonl_decomposed(file_path: str):
    """Parse a .jsonl file and return list of ProofNetEntry objects.
    
    Args:
        file_path: Path to .jsonl file
        
    Returns:
        List of ProofNetEntry objects containing parsed data
    """
    entries = []
    with open(file_path, 'r') as f:
        for line in f:
            if line.strip():  # Skip empty lines
                data = json.loads(line)
                entry = ProofNetEntryDecomposed(
                    name=data['name'],
                    split=data['split'],
                    informal_prefix=data['informal_prefix'],
                    formal_statement=data['formal_statement'], 
                    goal=data['goal'],
                    user_prompt=data['user_prompt'],
                    decomposition=data['decomposition'],
                    header=data.get('header')  # Optional field
                )
                entries.append(entry)
    return entries

# Use the generic parse_jsonl function for both file types
def parse_proofnet(file_path: str):
    return parse_jsonl(file_path)

def parse_minif2f(file_path: str):
    return parse_jsonl(file_path)


if __name__ == "__main__":
    proofnet_entries = parse_proofnet("proofnet.jsonl")
    minif2f_entries = parse_minif2f("minif2f.jsonl")
    print(proofnet_entries[2].informal_prefix)
    print(proofnet_entries[2].formal_statement)
    
    # Export informal prefixes to txt file
    with open("proofnet_informal_prefixes.txt", "w") as f:
        for entry in proofnet_entries:
            f.write(entry.informal_prefix)
    print("Exported informal prefixes to proofnet_informal_prefixes.txt")

    # Export formal statements to txt file
    with open("proofnet_formal_statements.txt", "w") as f:
        for entry in proofnet_entries:
            f.write(entry.formal_statement)
    print("Exported formal statements to proofnet_formal_statements.txt")