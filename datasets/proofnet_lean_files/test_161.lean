import Mathlib

open Filter Set TopologicalSpace
open scoped Topology



theorem countable_product_dense_subset {X : Type*} [∀ i, TopologicalSpace (X i)] 
  (h : ∀ i, ∃ (s : Set (X i)), Countable s ∧ Dense s) : 
  ∃ (s : Set (Π i, X i)), Countable s ∧ Dense s := by

done