import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators



theorem finite_group_element_order {G : Type*} [Group G] [Fintype G] (a : G) : 
  ∃ (n : ℕ), 0 < n ∧ a ^ n = 1 := by

done