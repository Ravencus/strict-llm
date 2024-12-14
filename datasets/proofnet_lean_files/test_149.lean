import Mathlib

open Filter Set TopologicalSpace
open scoped Topology

abbrev I : Set ℝ := Icc 0 1



theorem sequence_not_converge_uniformly : 
  ∀ (f : ℕ → I → ℝ) (h : ∀ x n, f n x = x ^ n), ¬ (∃ f₀ : I → ℝ, TendstoUniformly f f₀ atTop) := by

done