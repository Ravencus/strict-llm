import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators



theorem exercise_2_1_26 {G : Type*} [Group G]
  [Fintype G] (a : G) : ∃ (n : ℕ), a ^ n = 1 :=by

done