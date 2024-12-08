import os
import requests
from zipfile import ZipFile

output_dir = "datasets/miniF2F"
os.makedirs(output_dir, exist_ok=True)

url = "https://github.com/openai/miniF2F/archive/refs/heads/main.zip"
local_zip = os.path.join(output_dir, "miniF2F.zip")

print("Downloading miniF2F dataset...")
response = requests.get(url)
with open(local_zip, "wb") as f:
    f.write(response.content)

print("Extracting miniF2F dataset...")
with ZipFile(local_zip, "r") as zip_ref:
    zip_ref.extractall(output_dir)

os.remove(local_zip)
print(f"miniF2F dataset downloaded and extracted to {output_dir}.")
