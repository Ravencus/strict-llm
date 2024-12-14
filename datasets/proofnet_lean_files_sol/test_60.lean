import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators



theorem exercise_5_4_3 {a : ℂ} {p : ℂ → ℂ}
  (hp : p = λ (x : ℂ) => x^5 + sqrt 2 * x^3 + sqrt 5 * x^2 + sqrt 7 * x + 11)
  (ha : p a = 0) :
  ∃ p : Polynomial ℂ , p.degree < 80 ∧ a ∈ p.roots ∧
  ∀ n : p.support, ∃ a b : ℤ, p.coeff n = a / b :=by

done