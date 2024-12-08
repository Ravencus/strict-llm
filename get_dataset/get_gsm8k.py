from datasets import load_dataset
import os

output_dir = "datasets/GSM8K"
os.makedirs(output_dir, exist_ok=True)

print("Downloading GSM8K dataset...")
dataset = load_dataset("gsm8k", "main")

for split in ["train", "test"]:
    dataset[split].to_json(
        os.path.join(output_dir, f"{split}.json"), orient="records", lines=True
    )

print(f"GSM8K dataset saved to {output_dir}.")
