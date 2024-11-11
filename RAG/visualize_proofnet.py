import json
from pathlib import Path

def parse_minif2f_jsonl(path):
    """Parse minif2f.jsonl file and return list of statements"""
    statements = []
    with open(path, encoding='utf-8') as f:
        for line in f:
            statements.append(json.loads(line))
    return statements

def construct_md_from_minif2f():
    # Read minif2f.jsonl
    minif2f_path = Path("datasets/minif2f.jsonl")
    statements = parse_minif2f_jsonl(minif2f_path)
    
    # Construct markdown content
    md_content = "# Informal Prefixes from miniF2F\n\n"
    
    for i, statement in enumerate(statements, 1):
        # Add section header
        md_content += f"## Statement {i}\n"
        
        # Add informal prefix
        md_content += f"{statement['informal_prefix']}\n\n"
        
        # Add formal statement in code block
        md_content += "```lean\n"
        md_content += f"{statement['formal_statement']}\n"
        md_content += "```\n\n"
    
    # Write to output file
    output_path = Path("output/informal_prefixes_minif2f.md")
    output_path.parent.mkdir(exist_ok=True)
    output_path.write_text(md_content, encoding='utf-8')

if __name__ == "__main__":
    construct_md_from_minif2f()
