import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators



theorem algebraic_degree_at_most_80 {a : ℂ} (h : (λ x : ℂ, x^5 + real.sqrt 2 * x^3 + real.sqrt 5 * x^2 + real.sqrt 7 * x + real.sqrt 11) a = 0) : 
  is_algebraic ℚ a ∧ (∃ p : polynomial ℚ, p.degree ≤ 80 ∧ a.is_root p) :=
begin
  -- Proof goes here
end

done