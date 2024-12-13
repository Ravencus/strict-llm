import Mathlib

open Filter Real Function
open scoped Topology



theorem compact_disjoint_min_distance {M : Type*} [MetricSpace M] {A B : Set M} 
  (hAc : IsCompact A) (hBc : IsCompact B) (hAd : A.Nonempty) (hBd : B.Nonempty) (hAB : Disjoint A B) :
  ∃ a₀ ∈ A, ∃ b₀ ∈ B, ∀ a ∈ A, ∀ b ∈ B, dist a₀ b₀ ≤ dist a b := by

done