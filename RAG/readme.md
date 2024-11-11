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


