import json
from dataclasses import dataclass
from typing import Optional
import pandas as pd
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


def read_parquet_obt(file_path: str):
    
    """Read a parquet file and return list of entries.
    
    Args:
        file_path: Path to parquet file
        
    Returns:
        List of entries containing parsed data
    """
    import pandas as pd
    
    df = pd.read_parquet(file_path, engine='pyarrow')
    entries = []
    
    for _, row in df.iterrows():
        entry = {
            "Name": row['Name'],
            "Statement": row['Statement'],
            "Proof": row['Proof'], 
            "Generated_informal_statement_and_proof": row['Generated_informal_statement_and_proof'],
            "Commented_proof": row['Commented_proof'],
            "File_path": row['File_path'],
            "Commit": row['Commit']
        }
        entries.append(entry)
        
    return entries

def read_parquet_lean_workbook(file_path: str):
    df = pd.read_parquet(file_path, engine='pyarrow')
    entries = []
    for _, row in df.iterrows():
        try:
            entry = {
                "id": row['id'],
                "status": row['status'], 
                "tactic": row['tactic'],
                "state_before": row['state_before'],
                "state_after": row['state_after'],
                "natural_language_statement": row['natural_language_statement'],
                "answer": row['answer'],
                "formal_statement": row['formal_statement']
            }
        except Exception as e:
            print(f"Error processing row: {row}")
            print(f"Error details: {str(e)}")
            entry = row.to_dict()
        entries.append(entry)
        
    return entries

if __name__ == "__main__":
    obt_entries = read_parquet_obt("obt.parquet")
    lean_workbook_entries = read_parquet_lean_workbook("lean_workbook.parquet")
    
    print("First OBT entry:")
    print(obt_entries[0])
    print("\nFirst Lean Workbook entry:")
    print(lean_workbook_entries[0])
    
    # proofnet_entries = parse_proofnet("proofnet.jsonl")
    # minif2f_entries = parse_minif2f("minif2f.jsonl")
    # print(proofnet_entries[2].informal_prefix)
    # print(proofnet_entries[2].formal_statement)
    
    # # Export informal prefixes to txt file
    # with open("proofnet_informal_prefixes.txt", "w") as f:
    #     for entry in proofnet_entries:
    #         f.write(entry.informal_prefix)
    # print("Exported informal prefixes to proofnet_informal_prefixes.txt")

    # # Export formal statements to txt file
    # with open("proofnet_formal_statements.txt", "w") as f:
    #     for entry in proofnet_entries:
    #         f.write(entry.formal_statement)
    # print("Exported formal statements to proofnet_formal_statements.txt")