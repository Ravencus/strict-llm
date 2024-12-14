import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem exercise_4_5_17 {G : Type*} [Fintype G] [Group G]
  (hG : card G = 105) :
  Nonempty (Sylow 5 G) ∧ Nonempty (Sylow 7 G) :=by

done