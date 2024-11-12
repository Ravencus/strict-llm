from generate_response import generate_response
from lean_compiler import *


# CoT interface
class ContinuousCoTInterface:
    def __init__(self, system_message):
        self.system_message = system_message
        self.history = []  # Stores the sequence of messages and responses

    def add_feedback_and_generate(self, user_message, feedback=""):
        # Combine the history with the new user message and feedback
        if self.history:
            combined_prompt = self.history[-1] + " " + feedback + " " + user_message
        else:
            combined_prompt = user_message

        # Generate response using the updated combined prompt
        response = generate_response(self.system_message, combined_prompt)

        # Store the combined prompt and response for continuous CoT
        self.history.append(combined_prompt)
        self.history.append(response)

        return response

    def get_history(self):
        # Retrieve the conversation history for review or further processing
        return self.history

    def save_to_lean_file(self, response, filename="test.lean"):
        # Write the generated response to a .lean file
        with open(filename, "w") as file:
            file.write(response)
        print(f"Response saved to {filename}")


# Example usage
if __name__ == "__main__":
    system_message = "You will be provided with natural language and retrieved information, and your task is to convert them to lean4 code."
    cot_interface = ContinuousCoTInterface(system_message)

    # Initial message
    user_message = "Natural language: ... Retrieved information: ..."
    output = generate_response(system_message, user_message)
    cot_interface.save_to_lean_file(output)
    lean_file_path = "test.lean"
    feedback = process_lean_input(lean_file_path)

    # Generate response
    output = cot_interface.add_feedback_and_generate(output, feedback)
    cot_interface.save_to_lean_file(output)
    lean_file_path = "test.lean"
    additional_feedback = process_lean_input(lean_file_path)

    # Further CoT example with updated feedback
    output = cot_interface.add_feedback_and_generate(output, additional_feedback)

    print("Next response in CoT:", output)
    print("Conversation History:", cot_interface.get_history())
