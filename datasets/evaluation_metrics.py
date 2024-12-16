import json


def is_correct_output(output):
    """
    Check if the output is correct based on given rules.

    :param output: The output string to check
    :return: True if the output is correct, False otherwise
    """
    if "unknown identifier" in output:
        return False
    if "unsolved goals" in output:
        return True
    return False


def calculate_accuracy(file_path):
    """
    Calculate the accuracy of outputs in a JSON file.

    :param file_path: Path to the JSON file
    :return: Accuracy as a float
    """
    with open(file_path, "r", encoding="utf-8") as file:
        data = json.load(file)

    total_entries = len(data)
    correct_entries = 0

    for entry in data:
        output = entry.get("output", "")
        if is_correct_output(output):
            correct_entries += 1

    accuracy = correct_entries / total_entries if total_entries > 0 else 0
    return accuracy, correct_entries


if __name__ == "__main__":
    # file_path = "minif2f_log_with_extracted_output.json"
    file_path = "proofnet_log_with_extracted_output.json"
    accuracy, correct_entries = calculate_accuracy(file_path)
    print(f"Accuracy: {accuracy * 100:.2f}%, Correct entries: {correct_entries}")
