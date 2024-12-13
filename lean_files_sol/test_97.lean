import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem exercise_1_1_4 (n : ℕ) :
  ∀ (a b c : ℕ), (a * b) * c ≡ a * (b * c) [ZMOD n] :=by

done