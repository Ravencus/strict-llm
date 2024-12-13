import Mathlib

open Real
open scoped BigOperators



theorem exercise_3_5
  (a b : ℕ → ℝ)
  (h : limsup a + limsup b ≠ 0) :
  limsup (λ n => a n + b n) ≤ limsup a + limsup b :=by

done