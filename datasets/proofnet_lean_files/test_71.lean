import Mathlib

open Function Fintype Subgroup Ideal Polynomial Submodule Zsqrtd
open scoped BigOperators



theorem vector_space_not_union_of_finitely_many_proper_subspaces 
  {F V ι : Type*} [Infinite F] [Field F] [AddCommGroup V] [Module F V] 
  {u : ι → Submodule F V} (hu : ∀ i : ι, u i ≠ ⊤) : 
  (⋃ i : ι, (u i : Set V)) ≠ ⊤ := by

done