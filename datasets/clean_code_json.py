import json
import re
import os
import sys


def extract_lean(response_text):
    """Extract the Lean part from the response and remove unwanted trailing parts."""
    start_marker = "```lean"
    end_marker = "```"
    unwanted_trailing = r":=\s*begin\s*-- proof goes here\s*end"
    start = response_text.find(start_marker)
    end = response_text.find(end_marker, start + len(start_marker))
    if start != -1 and end != -1:
        extracted = response_text[start + len(start_marker) : end].strip()
        # Remove unwanted trailing part using regex
        extracted = re.sub(unwanted_trailing, "", extracted).strip()
        return extracted
    return response_text.strip()


# Get script directory path
script_dir = os.path.dirname(os.path.abspath(__file__))

# Set input and output file paths
input_file = os.path.join(script_dir, "minif2f_log.json")
output_file = os.path.join(script_dir, "minif2f_log_with_extracted.json")

try:
    # Read the entire JSON file
    with open(input_file, "r", encoding="utf-8") as file:
        entries = json.load(file)

    # Process each entry
    processed_entries = []
    for entry in entries:
        if "response" in entry:
            entry["extracted_lean"] = extract_lean(entry["response"])
            processed_entries.append(entry)

    # Write processed entries
    with open(output_file, "w", encoding="utf-8") as file:
        json.dump(processed_entries, file, ensure_ascii=False, indent=2)

    print(f"Processing complete. Results saved to: {output_file}")
    print(f"Total entries processed: {len(processed_entries)}")

except Exception as e:
    print(f"An error occurred: {e}")
    import traceback

    traceback.print_exc()
