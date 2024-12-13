import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem not_simple_if_card_6545 {G : Type*} [Fintype G] [Group G] (hG : card G = 6545) : ¬ IsSimpleGroup G := by

done