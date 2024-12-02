## fine-grained RAG

### construction
input: natural language math statement

process:

- whole statement -> semantic segments
- semantic segments -> components(math concepts, math expressions, logic relations)
- find relation between components and lean expressions
- build RAG based on these relations

pre-process:
the RAG could be classified(tag, labeling) into groups / hierarchical forms.

data-generation:
need to generate specifics from mathlib4.
    difficulties:
    non-obvious naming and properties
    no examples attached

Is it worth to build a tracable knowledge base for that?

New thoughts on process: LEAN is more regular with each (*) contains a component and several (*) contribute to a natural language statement. We use CoT prompting strategy to extract correspondence.

export OPENAI_API_KEY="your_api_key_here"

max_tokens can be predicted


### another group of knowledge: differential effect of a tactic

A typical LEAN proof is two streams of tactics merging into a middle point. Roughly, we can view the current position of the proof as proof states, and each tactic is an action on a proof state, making it transit to another. A proof state consists of all the current hypotheses, and all the goals that need to be resolved. The bottom-top stream is a series of tactics that modifies the hypotheses and move them towards the goals, and the top-down stream changes the goals and makes them closer to the hypotheses. In theory, a distance can be designed to describe such process, and that mimics the human's evaluation of whether or not we are moving towards a solution.

The Autoformalizer, which is supposed to change natural language proofs into LEAN tactics, could benefit from the ability of understanding what each tactic does. It's a dedicated knowledge base where human called "examples". Examples contain patterns, and when matched, similar tactics could be applied. This is very different from the statement formalization where correspondence matters more. When we are dealing with tactics, we can utilize searching algorithms, let LLM prompt a series of methods and evaluate them simultaneously. In order to achieve this, we might first augment the original proof and take the proof states into concern: say we are gonna rewrite several terms. Instead of doing it consecutively, we can specify how we do them and why we do them, preferably step by step.

Also, in order to capture the big idea(the sketch, the abstract, the core idea from each introduced lemma and hypos), we can find a smart clustering/grouping algorithm to find "which tactics are frequently used together" in order to avoid unnecessary details.

Is there a way of training such distance function for further use?

One big problem remains: how to select the appropriate function inside the huge library? The most ideal case would be having a knowledge base that stores examples for each function. Such thing, however, does not exist.
