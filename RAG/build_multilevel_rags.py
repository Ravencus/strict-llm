import pickle as pkl
import os
import numpy as np
import copy
from tqdm import tqdm
from llama_index.llms.openai import OpenAI
from llama_index.embeddings.openai import OpenAIEmbedding
from datasets.parser import parse_jsonl_decomposed
    

class multilevel_rag_builder:
    def __init__(self, llm_model="gpt-4o-2024-08-06", embed_model="text-embedding-3-small") -> None:
        self.llm = OpenAI(model=llm_model)
        self.embed_model = OpenAIEmbedding(model=embed_model)
        self.statement_decomposed_rag_dict = {}

    def get_text_emgeddings(self, text):
        embedding = self.embed_model.get_text_embedding(text)
        return embedding
    
    def build_statement_decomposed_rag_database(self, statement_decomposed_jsonl, split, save_to_disk=True, overwrite=False):
        state_decomposed_rag_path = statement_decomposed_jsonl.replace(".jsonl", "_statement_rag.pkl")
        if not overwrite and os.path.exists(state_decomposed_rag_path):
            with open(state_decomposed_rag_path, "rb") as f:
                self.statement_decomposed_rag_dict = pkl.load(f)
            print("Loaded statement decomposition file from disk, len: {}, to overwrite, set overwrite flag to True.".format(len(self.statement_decomposed_rag_dict)))
            return self.statement_decomposed_rag_dict
        print("Start processing {} decomposition.".format(statement_decomposed_jsonl))
        entries = parse_jsonl_decomposed(statement_decomposed_jsonl)
        for entry in tqdm(entries):
            if entry.split == split:
                decomposition = entry.decomposition
                object = entry
                for key, value in decomposition.items():
                    embedding = np.array(self.get_text_emgeddings(key))
                    self.statement_decomposed_rag_dict[key] = {
                        "object": object,
                        "key_embeddings": embedding,
                        "value": value
                    }
        if save_to_disk:
            with open(state_decomposed_rag_path, "wb") as f:
                pkl.dump(self.statement_decomposed_rag_dict, f)
        return self.statement_decomposed_rag_dict
    
    def query_statement_rag_database(self, statement, top_k):
        if len(self.statement_decomposed_rag_dict) == 0:
            raise ValueError("Empty decomposed_rag_dict, run build_statement_decomposed_rag_database function to first build")
        if len(self.statement_decomposed_rag_dict) <= top_k:
            return copy.deepcopy(self.statement_decomposed_rag_dict)
        else:
            score_record = []
            target = self.get_text_emgeddings(statement)
            for key in self.statement_decomposed_rag_dict:
                source = self.statement_decomposed_rag_dict[key]["key_embeddings"]
                score = np.dot(source, target)/(np.linalg.norm(source)*np.linalg.norm(target))
                score_record.append((key, score))
            score_record = sorted(score_record, key=lambda x: x[1], reverse=True)
            top_k_results = []
            for i in range(top_k):
                key = score_record[i][0]
                top_k_results.append({
                    "score": score_record[i][1],
                    "matched_key": key,
                    "matched_decompose": copy.deepcopy(self.statement_decomposed_rag_dict[key]['object'].decomposition[key])
                })
            return top_k_results
    
    def test_dataset_split(self, statement_decomposed_jsonl, split, top_k, save_to_disk):
        state_decomposed_test_path = statement_decomposed_jsonl.replace(".jsonl", "_statement_test.pkl")
        print("Start testing {} decomposition.".format(statement_decomposed_jsonl))
        entries = parse_jsonl_decomposed(statement_decomposed_jsonl)
        test_result_list = []
        for entry in tqdm(entries):
            if entry.split == split:
                decomposition = entry.decomposition
                object = entry
                test_result_decomp_dict = {}
                for key in decomposition:
                    top_k_results = self.query_statement_rag_database(key, top_k=top_k)
                    test_result_single = {
                        "top_k_results": top_k_results,
                        "k": top_k
                    }
                    test_result_decomp_dict[key] = test_result_single
                test_result_list.append(
                    {
                        "object": object,
                        "decomposition_result": test_result_decomp_dict
                    }
                )
            else:
                print("Skipping not in split.", entry)
        if save_to_disk:
            with open(state_decomposed_test_path, "wb") as f:
                print("Saving test results to: {}".format(state_decomposed_test_path))
                pkl.dump(test_result_list, f)
        return test_result_list

    def return_test_scores(self, statement_decomposed_jsonl, top_k):
        state_decomposed_test_path = statement_decomposed_jsonl.replace(".jsonl", "_statement_test.pkl")
        f = open(state_decomposed_test_path, "rb")
        test_result_dict = pkl.load(f)
        f.close()
        top_k_scores = []    
        for test_entry in test_result_dict:
            decomposition_result = test_entry["decomposition_result"]
            for key in decomposition_result:
                top_k_results = decomposition_result[key]["top_k_results"]
                for i in range(top_k):
                    top_k_scores.append(top_k_results[i]['score'])
        state_decomposed_score_path = statement_decomposed_jsonl.replace(".jsonl", "_statement_testscores.pkl")
        with open(state_decomposed_score_path, "wb") as f:
            print("Saving test scores to: {}".format(state_decomposed_score_path))
            pkl.dump(top_k_scores, f)
        return top_k_scores
    
    def highest_similarity_normalized(self, s1, s2):
        max_score = 0
        best_position = -1

        # Slide s2 over s1
        for i in range(len(s1) - len(s2) + 1):
            # Extract substring of s1
            substring = s1[i:i + len(s2)]
            # Calculate similarity score (number of matching characters)
            score = sum(1 for a, b in zip(substring, s2) if a == b)
            # Normalize the score by dividing by the length of s2
            normalized_score = score / len(s2)
            # Update max_score and position
            if normalized_score > max_score:
                max_score = normalized_score
                best_position = i
        return max_score, best_position

    def query_statement_rag_database_full_statement_embedding(self, full_statement, top_k):
        # sliding window matching, assume full statement is longer than key
        if len(self.statement_decomposed_rag_dict) == 0:
            raise ValueError("Empty decomposed_rag_dict, run build_statement_decomposed_rag_database function to first build")
        if len(self.statement_decomposed_rag_dict) <= top_k:
            return copy.deepcopy(self.statement_decomposed_rag_dict)
        else:
            score_record = []
            target = self.get_text_emgeddings(full_statement)
            for key in self.statement_decomposed_rag_dict:
                source = self.statement_decomposed_rag_dict[key]["key_embeddings"]
                score = np.dot(source, target)/(np.linalg.norm(source)*np.linalg.norm(target))
                score_record.append((key, score))
            score_record = sorted(score_record, key=lambda x: x[1], reverse=True)
            top_k_results = []
            for i in range(top_k):
                key = score_record[i][0]
                top_k_results.append({
                    "score": score_record[i][1],
                    "matched_key": key,
                    "matched_decompose": copy.deepcopy(self.statement_decomposed_rag_dict[key]['object'].decomposition[key])
                })
            return top_k_results

    def query_statement_rag_database_full_statement_window(self, full_statement, top_k):
        # sliding window matching, assume full statement is longer than key
        if len(self.statement_decomposed_rag_dict) == 0:
            raise ValueError("Empty decomposed_rag_dict, run build_statement_decomposed_rag_database function to first build")
        if len(self.statement_decomposed_rag_dict) <= top_k:
            return copy.deepcopy(self.statement_decomposed_rag_dict)
        else:
            score_record = []
            target = full_statement
            for key in self.statement_decomposed_rag_dict:
                source = key
                if len(target) < len(source):
                    score = 0.0 
                else:
                    score, _ = self.highest_similarity_normalized(target, source)
                score_record.append((key, score))
            score_record = sorted(score_record, key=lambda x: x[1], reverse=True)
            top_k_results = []
            for i in range(top_k):
                key = score_record[i][0]
                top_k_results.append({
                    "score": score_record[i][1],
                    "matched_key": key,
                    "matched_decompose": copy.deepcopy(self.statement_decomposed_rag_dict[key]['object'].decomposition[key])
                })
            return top_k_results


if __name__ == "__main__":
    current_dir = os.path.dirname(os.path.abspath(__file__))
    mrb_proofnet = multilevel_rag_builder()
    state_decomposed_path = os.path.join(current_dir, "..", "datasets", "proofnet_decomposed.jsonl")
    mrb_proofnet.build_statement_decomposed_rag_database(state_decomposed_path, split="valid")
    top_k_results = mrb_proofnet.query_statement_rag_database_full_statement_window("/-- Suppose that $f$ is holomorphic in an open set $\\Omega$. Prove that if $\\text{Im}(f)$ is constant, then $f$ is constant.-/\n", top_k=5)
    print(top_k_results)
    # mrb_proofnet.test_dataset_split(state_decomposed_path, split="test", top_k=5, save_to_disk=True)
    # top_k_scores_proofnet = mrb_proofnet.return_test_scores(state_decomposed_path, top_k=1)

    # mrb_minif2f = multilevel_rag_builder()
    # state_decomposed_path = os.path.join(current_dir, "..", "datasets", "minif2f_decomposed.jsonl")
    # mrb_minif2f.build_statement_decomposed_rag_database(state_decomposed_path, split="valid")
    # mrb_minif2f.test_dataset_split(state_decomposed_path, split="test", top_k=5, save_to_disk=True)
    # top_k_scores_minif2f = mrb_minif2f.return_test_scores(state_decomposed_path, top_k=1)

    # proofnet_query = "then $f$ is constant"
    # top_k_results = mrb_proofnet.query_statement_rag_database(proofnet_query, top_k=5)
    # print(top_k_results)

    # minif2f_query = "$a$ and $b$ be real numbers"
    # top_k_results = mrb_minif2f.query_statement_rag_database(minif2f_query, top_k=5)
    # print(top_k_results)

