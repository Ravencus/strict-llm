import Mathlib

open scoped BigOperators



theorem exists_positive_integer_n (a b c : ℤ) : ∃ n : ℕ, n > 0 ∧ ¬ ∃ k : ℤ, k^2 = n^3 + a * n^2 + b * n + c := by

done