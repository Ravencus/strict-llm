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

def parse_proofnet(file_path: str) -> list[ProofNetEntry]:
    """Parse proofnet.jsonl file and return list of ProofNetEntry objects.
    
    Args:
        file_path: Path to proofnet.jsonl file
        
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

def parse_minif2f(file_path: str) -> list[ProofNetEntry]:
    """Parse minif2f.jsonl file and return list of ProofNetEntry objects.
    
    Args:
        file_path: Path to minif2f.jsonl file
        
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


if __name__ == "__main__":
    proofnet_entries = parse_proofnet("proofnet.jsonl")
    minif2f_entries = parse_minif2f("minif2f.jsonl")
    print(proofnet_entries[2].informal_prefix)
    print(proofnet_entries[2].formal_statement)
    # print(proofnet_entries[2].goal)
    # print(minif2f_entries[0])
