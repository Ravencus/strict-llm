import Mathlib

open Filter Set TopologicalSpace
open scoped Topology

def rational (x : ℝ) := x ∈ range ((↑) : ℚ → ℝ)



theorem countable_basis_for_R2 : 
  (generateFrom {S : Set (ℝ × ℝ) | ∃ a b c d : ℚ, a < b ∧ c < d ∧ S = Ioo (a : ℝ) (b : ℝ) ×ˢ Ioo (c : ℝ) (d : ℝ)}).IsOpen :=
by

done