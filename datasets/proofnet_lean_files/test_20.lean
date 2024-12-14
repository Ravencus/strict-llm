import Mathlib

open Filter Real Function
open scoped Topology



theorem open_set_union_disjoint_segments {X : Type*} [TopologicalSpace X] :
  ∀ (U : Set X), IsOpen U → ∃ (P₁ P₂ : Set X), U = P₁ ∪ P₂ ∧ IsClosed P₁ ∧ P₁ = {x | ClusterPt x (𝓟 P₁)} ∧ Set.Countable P₂ := by

done