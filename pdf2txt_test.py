import os
from openai import OpenAI
import base64


def encode_image(image_path):
    with open(image_path, "rb") as image_file:
        return base64.b64encode(image_file.read()).decode("utf-8")


def extract_latex(response_text):
    """Extract the LaTeX part from the response."""
    start_marker = "```latex"
    end_marker = "```"

    start = response_text.find(start_marker)
    end = response_text.find(end_marker, start + len(start_marker))

    if start != -1 and end != -1:
        return response_text[start + len(start_marker) : end].strip()
    return response_text.strip()


def process_image(image_path):
    base64_image = encode_image(image_path)

    client = OpenAI(
        api_key="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"
    )

    response = client.chat.completions.create(
        model="gpt-4o-mini",
        messages=[
            {
                "role": "user",
                "content": [
                    {
                        "type": "text",
                        "text": "Convert the text in this image to LaTeX format.",
                    },
                    {
                        "type": "image_url",
                        "image_url": {"url": f"data:image/jpg;base64,{base64_image}"},
                    },
                ],
            }
        ],
    )
    full_response = response.choices[0].message.content
    latex_content = extract_latex(full_response)
    return latex_content


if __name__ == "__main__":
    IMAGE_PATH = "test23.jpg"
    latex_content = process_image(IMAGE_PATH)
    print("Converted LaTeX content:")
    print(latex_content)
