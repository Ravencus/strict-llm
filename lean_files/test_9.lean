import Mathlib

open Real
open scoped BigOperators



theorem entire_injective_form : 
  ∀ (f : ℂ → ℂ), (hf : UniformContinuous f) (hg : Injective f) → 
  ∃ (a b : ℂ), a ≠ 0 ∧ ∀ z : ℂ, f z = a * z + b := by

done