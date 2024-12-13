import Mathlib

open Fintype Complex Polynomial LinearMap FiniteDimensional Module Module.End
open scoped BigOperators



theorem no_order_on_complex_field : ¬ ∃ (R : Type) [field R] [linear_ordered_field R], R ≃ₐ[ℝ] ℂ := by

done