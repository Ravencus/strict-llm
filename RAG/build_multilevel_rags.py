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
    
    def build_statement_decomposed_rag_database(self, statement_decomposed_jsonl, save_to_disk=True, overwrite=False):
        state_decomposed_rag_path = statement_decomposed_jsonl.replace(".jsonl", "_statement_rag.pkl")
        if not overwrite and os.path.exists(state_decomposed_rag_path):
            with open(state_decomposed_rag_path, "rb") as f:
                self.statement_decomposed_rag_dict = pkl.load(f)
            print("Loaded statement decomposition file from disk, len: {}, to overwrite, set overwrite flag to True.".format(len(self.statement_decomposed_rag_dict)))
            return self.statement_decomposed_rag_dict
        print("Start processing {} decomposition.".format(statement_decomposed_jsonl))
        entries = parse_jsonl_decomposed(statement_decomposed_jsonl)
        for entry in tqdm(entries):
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
    
    def query_statement_rag_database(self, statement, top_k=5):
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
            topk_results = {}
            for i in range(top_k):
                key = score_record[i][0]
                topk_results[key] = copy.deepcopy(self.statement_decomposed_rag_dict[key])
            return topk_results


if __name__ == "__main__":
    mrb_proofnet = multilevel_rag_builder()
    current_dir = os.path.dirname(os.path.abspath(__file__))
    state_decomposed_path = os.path.join(current_dir, "..", "datasets", "proofnet_decomposed.jsonl")
    mrb_proofnet.build_statement_decomposed_rag_database(state_decomposed_path)
    mrb_minif2f = multilevel_rag_builder()
    state_decomposed_path = os.path.join(current_dir, "..", "datasets", "minif2f_decomposed.jsonl")
    mrb_minif2f.build_statement_decomposed_rag_database(state_decomposed_path)
