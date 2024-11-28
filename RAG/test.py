from llama_index.core import VectorStoreIndex, SimpleDirectoryReader

documents = SimpleDirectoryReader("mathlib4/Mathlib/MeasureTheory/MeasurableSpace").load_data()
index = VectorStoreIndex.from_documents(documents)

query_engine = index.as_query_engine()
response = query_engine.query("Show me theorem map_top and its code")
print(response)