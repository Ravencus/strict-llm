import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem exercise_4_2_8 {G : Type*} [Group G] {H : Subgroup G}
  {n : ℕ} (hn : n > 0) (hH : H.index = n) :
  ∃ K ≤ H, K.Normal ∧ K.index ≤ n.factorial :=by

done