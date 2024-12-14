import Mathlib

open Fintype Complex Polynomial LinearMap FiniteDimensional Module Module.End
open scoped BigOperators



theorem bounded_holomorphic_zeros_sum {f : ℂ → ℂ} (Ω : Set ℂ) (hΩ : IsOpen Ω) (hf : DifferentiableOn ℂ f Ω) 
  (hf_bounded : ∀ x ∈ Set.Ioo a b, deriv f x > 0) (hf_nonzero : f 0 = 0) 
  (hz0 : ∀ n, ‖z n‖ < 1) : 
  ∑ n, (1 - ‖z n‖) < ∞ := by

done