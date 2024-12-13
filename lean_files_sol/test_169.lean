import Mathlib

open Real
open scoped BigOperators



theorem exercise_1_30 {n : ℕ} :
  ¬ ∃ a : ℤ, ∑ i : Fin n, (1 : ℚ) / (n+2) = a :=by

done