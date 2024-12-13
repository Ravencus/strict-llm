import json
import os
from lean_cmd_exec import execute_lean_files


def load_headers(jsonl_file):
    """从 JSONL 文件加载 headers 并返回一个字典。"""
    headers = {}
    with open(jsonl_file, "r") as file:
        for line in file:
            entry = json.loads(line)
            headers[entry["name"]] = entry["header"]
    return headers


def main():
    # 文件路径
    extracted_file = "/Users/zhongkaiwen/Desktop/strict-llm/datasets/proofnet_log_with_extracted.json"
    decomposed_file = (
        "/Users/zhongkaiwen/Desktop/strict-llm/datasets/proofnet_decomposed.jsonl"
    )

    # 加载 JSON 数据
    with open(extracted_file, "r") as file:
        extracted_data = json.load(file)

    # 加载 headers 数据
    headers = load_headers(decomposed_file)

    # 创建存放 Lean 文件的目录
    lean_dir = "lean_files"
    os.makedirs(lean_dir, exist_ok=True)

    # 保存每条 extracted_lean 加 header 后到临时文件
    file_paths = []
    for i, entry in enumerate(extracted_data):
        lean_code = entry["extracted_lean"]
        name = entry["name"]

        # 查找对应的 header
        header = headers.get(name, "")

        # 合并 header 和 extracted_lean
        full_code = f"{header}\n\n{lean_code}\n\ndone"

        # 保存到文件
        file_name = os.path.join(lean_dir, f"test_{i+1}.lean")
        with open(file_name, "w") as lean_file:
            lean_file.write(full_code)
        file_paths.append(file_name)

    # 执行所有 Lean 文件
    results = execute_lean_files(file_paths)

    # 保存结果
    output_file = "lean_results.json"
    results_data = []
    for i, (file_path, output, exit_code) in enumerate(results):
        results_data.append(
            {
                "name": extracted_data[i]["name"],
                "file_path": file_path,
                "output": output,
                "exit_code": exit_code,
            }
        )

    with open(output_file, "w") as result_file:
        json.dump(results_data, result_file, indent=4)

    print(f"Results saved to {output_file}")


if __name__ == "__main__":
    main()
