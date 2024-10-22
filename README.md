# Strict-LLM: 2-step Autoformalization

## Roadmap

In the following discussion we use $N$ to denote natural language space, $PR$ to denote the space of Python pseudo code for representing LEAN, and $L$ the space of LEAN statement.

### Representation: constructing $PR$

- [ ] LEAN represented in Python: hand-written examples
- [ ] Automation rules: what can be a human-readable, machine interpretable, automated way of constructing such representation?

Main difficulties:

    - Functional Language vs Procedural Language
    - Annotations/Comments for readability
    - How to preserve faithfulness?
    - Specialized tokenizer for math language / change of LEAN writing style?
    - Eval: is there a way to crosscheck / calculate relatedness?
    - Breaks down: do for entire input seq, or first separate each component?
    - Is it even representable?

### Transformation: $N \rightarrow PR \rightarrow L$

- [ ] $N \rightarrow PR$: faithful and sound mapping: utilize code-LLM
- [ ] $PR \rightarrow L$: utilize IR and one-on-one correspondence(not necessarily LLM).

Main difficulties:
    - faithful and sound: hard to restrict, how to restrict?
    - co-design of IR and transformation
    - LLM guided IR
    - best-case-scenario: Python interpreter of LEAN
    - bad writing habit of LEAN library
    - Human-in-the-loop update for $N \rightarrow PR$ training
    - Accuracy of $PR \rightarrow L$


### Feedback-Update

idea:

    - Extract LEAN compiler output after formalization
    - preprocessor: interpret the error message / informalization?
    - preprocessor': goal extraction
    - preprocessor: RAG-like search for similar examples
    - feedback strategy: CoT-like prompting? Direct modification? Code-refactor-like prompting?
    - update strategy: global feedback-update vs local feedback-update?


## Related Work

