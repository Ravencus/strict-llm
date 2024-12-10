import openai
import base64
import os
from pdf2image import convert_from_path
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


def pdf_to_latex(pdf_path, output_folder):
    os.makedirs(output_folder, exist_ok=True)
    print("Converting PDF to images...")

    images = convert_from_path(pdf_path, dpi=300, output_folder=output_folder)
    print(f"{len(images)} pages found.")

    latex_results = []
    for page_num, image in enumerate(images, start=1):
        image_path = os.path.join(output_folder, f"page_{page_num}.jpg")
        image.save(image_path, "JPEG")
        print(f"Processing page {page_num}...")
        latex_content = process_image(image_path)
        latex_results.append((page_num, latex_content))
        print(f"Page {page_num} processed.")

    return latex_results


def save_latex_results(latex_results, output_folder):
    for page_num, latex_content in latex_results:
        output_file = os.path.join(output_folder, f"page_{page_num}.txt")
        with open(output_file, "w", encoding="utf-8") as f:
            f.write(latex_content)
        print(f"LaTeX content for page {page_num} saved to {output_file}.")


if __name__ == "__main__":
    PDF_PATH = "testcopy10.pdf"
    OUTPUT_FOLDER = "output_latex"

    latex_results = pdf_to_latex(PDF_PATH, OUTPUT_FOLDER)
    save_latex_results(latex_results, OUTPUT_FOLDER)
    print("PDF processing completed.")


# PDF_PATH = "Principles_of_Mathematical_Analysis-Rudin.pdf"
# OUTPUT_FOLDER = "output_images"
# os.makedirs(OUTPUT_FOLDER, exist_ok=True)

# print("Converting PDF to images...")
# images = convert_from_path(PDF_PATH, dpi=300, output_folder=OUTPUT_FOLDER)

# print("Performing OCR on images...")
# text = ""
# for i, image in enumerate(images):
#     print(f"Processing page {i + 1}/{len(images)}...")
#     page_text = pytesseract.image_to_string(image, lang="eng")
#     text += f"\n\n--- Page {i + 1} ---\n\n"
#     text += page_text

# OUTPUT_TEXT_FILE = "output_text.txt"
# with open(OUTPUT_TEXT_FILE, "w", encoding="utf-8") as f:
#     f.write(text)

# print(f"OCR complete. Extracted text saved to {OUTPUT_TEXT_FILE}")
