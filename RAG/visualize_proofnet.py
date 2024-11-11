# example:
# /-- Let $X$ be a metric space in which every infinite subset has a limit point. Prove that $X$ is separable.-/
#"theorem exercise_2_24 {X : Type*} [MetricSpace X]\n  (hX : ∀ (A : Set X), Infinite A → ∃ (x : X), x ∈ closure A) :\n  SeparableSpace X :=", "goal": "X : Type u_1\ninst✝ : MetricSpace X\nhX : ∀ (A : Set X), Infinite ↑A → ∃ x, x ∈ closure A\n⊢ SeparableSpace X", "header": "import Mathlib\n\nopen Topology Filter Real Complex TopologicalSpace Finset\nopen scoped BigOperators\n\n"}

import json
from pathlib import Path

def parse_proofnet_jsonl(path):
    """Parse proofnet.jsonl file and return list of statements"""
    statements = []
    with open(path, encoding='utf-8') as f:
        for line in f:
            statements.append(json.loads(line))
    return statements

def construct_md_from_proofnet():
    # Read proofnet.jsonl
    proofnet_path = Path("datasets/proofnet.jsonl")
    statements = parse_proofnet_jsonl(proofnet_path)
    
    # Construct markdown content
    md_content = "# Informal Prefixes from ProofNet\n\n"
    
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
    output_path = Path("output/informal_prefixes.md")
    output_path.parent.mkdir(exist_ok=True)
    output_path.write_text(md_content, encoding='utf-8')

if __name__ == "__main__":
    construct_md_from_proofnet()

