import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem normal_sylow_subgroups {G : Type*} [Fintype G] [Group G] (hG : card G = 105) :
  ∃ (N5 : Sylow 5 G), N5.Normal ∧ ∃ (N7 : Sylow 7 G), N7.Normal := by

done