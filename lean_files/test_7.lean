import Mathlib

open Complex Filter Function Metric Finset
open scoped BigOperators Topology



theorem analytic_function_is_polynomial {f : ℂ → ℂ} 
  (h_analytic : ∀ z, analytic_at ℂ f z)
  (h_coeff_zero : ∀ z₀ : ℂ, ∃ n : ℕ, (f.series z₀).coeff n = 0) : 
  ∃ p : polynomial ℂ, ∀ z : ℂ, f z = p.eval z

done