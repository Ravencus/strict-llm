from datasets import load_dataset
import os

dataset_name = "hoskinson-center/proofnet"
output_dir = "datasets/ProofNet"
os.makedirs(output_dir, exist_ok=True)

print("Downloading ProofNet dataset from Hugging Face...")
dataset = load_dataset(dataset_name)

for split in dataset.keys():  # splits: 'train', 'test', 'validation' (if available)
    file_path = os.path.join(output_dir, f"{split}.json")
    dataset[split].to_json(file_path, orient="records", lines=True)
    print(f"Saved {split} split to {file_path}.")

print("ProofNet dataset downloaded and saved.")
