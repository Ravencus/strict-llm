import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators



theorem exercise_2_10_1 {G : Type*} [Group G] (A : Subgroup G)
  [A.Normal] {b : G} (hp : Nat.Prime (orderOf b)) :
  A ⊓ (Subgroup.closure {b}) = ⊥ :=by

done