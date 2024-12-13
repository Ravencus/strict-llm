import Mathlib

open Fintype Complex Polynomial LinearMap FiniteDimensional Module Module.End
open scoped BigOperators



theorem cauchy_schwarz_variant {n : ℕ} (a b : ℕ → ℝ) :
  (∑ j in finset.range n, a j * b j) ^ 2 ≤ 
  (∑ j in finset.range n, j * (a j) ^ 2) * 
  (∑ j in finset.range n, (b j) ^ 2 / j) := by

done