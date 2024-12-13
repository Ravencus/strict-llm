import Mathlib

open Fintype Complex Polynomial LinearMap FiniteDimensional Module Module.End
open scoped BigOperators



theorem example_non_subspace : 
  ∃ U : Set (ℝ × ℝ), U ≠ ∅ ∧ (∀ (c : ℝ) (u : ℝ × ℝ), u ∈ U → c • u ∈ U) ∧ ∀ U' : Submodule ℝ (ℝ × ℝ), U ≠ ↑U' := by

done