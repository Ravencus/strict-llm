import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators



theorem exercise_5_1_8 {p m n: ℕ} {F : Type*} [Field F]
  (hp : Nat.Prime p) (hF : CharP F p) (a b : F) (hm : m = p ^ n) :
  (a + b) ^ m = a^m + b^m :=by

done