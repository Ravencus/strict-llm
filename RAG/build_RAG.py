import json
from openai import OpenAI
client = OpenAI()

# todo: find optimal max_tokens

system_prompt = """You will be provided with two statements: an "informal_prefix" and a "formal_statement". The "informal_prefix" contains a natural language math statement, and the "formal_statement" contains a LEAN code representation of that statement. Each () in the LEAN code represents a math concept or expression in the natural language statement. Your task is to find all the correspondence for () in "formal_statement".
An example is as follows:
example user input:
{"informal_prefix": "/-- Suppose $E\\subset\\mathbb{R}^k$ is uncountable, and let $P$ be the set of condensation points of $E$. Prove that $P$ is perfect.-/\\n", "formal_statement": "theorem exercise_2_27a (k : ℕ) (E P : Set (EuclideanSpace ℝ (Fin k)))\\n  (hE : E.Nonempty ∧ ¬ Set.Countable E)\\n  (hP : P = {x | ∀ U ∈ 𝓝 x, ¬ Set.Countable (P ∩ E)}) :\\n  IsClosed P ∧ P = {x | ClusterPt x (𝓟 P)} :="}
example output:
{"pairs": [("$E\\subset\\mathbb{R}^k$", "(E P : Set (EuclideanSpace ℝ (Fin k)))"),("uncountable", "(hE : E.Nonempty ∧ ¬ Set.Countable E)"),("let $P$ be the set of condensation points of $E$","(hP : P = {x | ∀ U ∈ 𝓝 x, ¬ Set.Countable (P ∩ E)})"),("Prove that $P$ is perfect","IsClosed P ∧ P = {x | ClusterPt x (𝓟 P)}")]}"
"""

user_prompt = """{"informal_prefix": "/-- Let $\Omega$ be a bounded open subset of $\mathbb{C}$, and $\varphi: \Omega \rightarrow \Omega$ a holomorphic function. Prove that if there exists a point $z_{0} \in \Omega$ such that $\varphi\left(z_{0}\right)=z_{0} \quad \text { and } \quad \varphi^{\prime}\left(z_{0}\right)=1$ then $\varphi$ is linear.-/", "formal_statement": "theorem exercise_2_9
  {f : ℂ → ℂ} (Ω : Set ℂ) (b : Bornology.IsBounded Ω) (h : IsOpen Ω)
  (hf : DifferentiableOn ℂ f Ω) (z : Ω) (hz : f z = z) (h'z : deriv f z = 1) :
  ∃ (f_lin : ℂ →L[ℂ] ℂ), ∀ x ∈ Ω, f x = f_lin x :="}
"""

def get_chat_completion(system_prompt: str, user_prompt: str, max_tokens: int = 256):
    response = client.chat.completions.create(
        model="gpt-4o",
        messages=[
            {
                "role": "system",
                "content": system_prompt
            },
            {
                "role": "user",
                "content": user_prompt
            }
        ],
        temperature=0.7,
        max_tokens=max_tokens,
        top_p=1
    )
    return response

# save response to a json file
with open('response.json', 'w') as f:
    json.dump(response.choices[0].message.content, f)
    
# print response
print(response.choices[0].message.content)
