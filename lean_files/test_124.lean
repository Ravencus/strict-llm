import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem not_simple_of_card_462 {G : Type*} [Fintype G] [Group G] (hG : card G = 462) : ¬ IsSimpleGroup G := by

done