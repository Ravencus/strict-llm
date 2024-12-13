import Mathlib

open scoped BigOperators



theorem sequence_periodic_if_zero_exists (a : ℝ) (x : ℕ → ℝ) 
  (h₀ : x 0 = 1) (h₁ : x 1 = a) (h₂ : x 2 = a)
  (h_rec : ∀ n ≥ 2, x (n + 1) = 2 * x n * x (n - 1) - x (n - 2)) :
  (∃ n, x n = 0) → ∃ T, ∀ n, x (n + T) = x n

done