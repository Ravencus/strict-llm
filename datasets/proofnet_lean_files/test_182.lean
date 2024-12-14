import Mathlib

open scoped BigOperators



theorem unique_positive_integers_exist : ∃! (a n : ℕ), a > 0 ∧ n > 0 ∧ a^(n+1) - (a+1)^n = 2001 := by

done