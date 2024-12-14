import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem exercise_3_2_16 (p : ℕ) (hp : Nat.Prime p) (a : ℕ) :
  Nat.Coprime a p → a ^ p ≡ a [ZMOD p] :=by

done