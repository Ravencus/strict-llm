import json

# 文件路径
proofnet_lean_results_path = "minif2f_lean_results.json"
proofnet_log_with_extracted_path = "minif2f_log_with_extracted.json"
output_file_path = "minif2f_log_with_extracted_output.json"


# 读取 JSON 文件
def read_json(file_path):
    with open(file_path, "r", encoding="utf-8") as file:
        return json.load(file)


# 写入 JSON 文件
def write_json(file_path, data):
    with open(file_path, "w", encoding="utf-8") as file:
        json.dump(data, file, ensure_ascii=False, indent=4)


# 加载文件
def main():
    lean_results = read_json(proofnet_lean_results_path)
    log_with_extracted = read_json(proofnet_log_with_extracted_path)

    # 创建一个从 name 到 output 的映射表
    name_to_output = {entry["name"]: entry["output"] for entry in lean_results}

    # 遍历 log_with_extracted 并插入 output
    for entry in log_with_extracted:
        name = entry.get("name")
        if name in name_to_output:
            entry["output"] = name_to_output[name]

    # 写入结果到新的文件
    write_json(output_file_path, log_with_extracted)
    print(f"合并完成，结果已保存到 {output_file_path}")


if __name__ == "__main__":
    main()
