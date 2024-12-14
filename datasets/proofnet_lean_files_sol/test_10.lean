import Mathlib

open Fintype Complex Polynomial LinearMap FiniteDimensional Module Module.End
open scoped BigOperators



theorem exercise_5_1 (f : ℂ → ℂ) (hf : DifferentiableOn ℂ f (ball 0 1))
  (hb : Bornology.IsBounded (Set.range f)) (h0 : f ≠ 0) (zeros : ℕ → ℂ) (hz : ∀ n, f (zeros n) = 0)
  (hzz : Set.range zeros = {z | f z = 0 ∧ z ∈ (ball (0 : ℂ) 1)}) :
  ∃ (z : ℂ), Tendsto (λ n => (∑ i in range n, (1 - zeros i))) atTop (𝓝 z) :=by

done