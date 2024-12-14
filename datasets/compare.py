import json
import os

# File paths for input and output
file1_path = "minif2f_lean_results.json"
file2_path = "minif2f_lean_results_sol.json"
output_txt_path = "minif2f_merged_outputs.txt"

# Read JSON files
with open(file1_path, "r", encoding="utf-8") as f:
    data1 = json.load(f)
with open(file2_path, "r", encoding="utf-8") as f:
    data2 = json.load(f)


# Function to extract content from file paths
def extract_file_content(file_path):
    if os.path.exists(file_path):
        with open(file_path, "r", encoding="utf-8") as f:
            return f.read()
    else:
        return "File not found: " + file_path


# Interleave data1 and data2 for output
interleaved_data = []
max_length = max(len(data1), len(data2))
for i in range(max_length):
    if i < len(data1):
        interleaved_data.append(data1[i])
    if i < len(data2):
        interleaved_data.append(data2[i])

# Process and create output
with open(output_txt_path, "w", encoding="utf-8") as output_file:
    for data in interleaved_data:
        name = data["name"]
        file_path = data["file_path"]
        output = data["output"]
        try:
            content = extract_file_content(file_path)
        except Exception as e:
            content = str(e)
        output_file.write(f"Name: {name}\nTest File: {file_path}\n\n")
        output_file.write(f"Content:\n{content}\n\n")
        output_file.write(f"Output:\n{output}\n\n")
        output_file.write("=" * 80 + "\n")

print(f"Output written to {output_txt_path}")
