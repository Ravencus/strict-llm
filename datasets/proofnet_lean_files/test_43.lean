import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators



theorem group_commute : 
  ∀ {G : Type*} [Group G], (∀ (K : Subgroup G), K.Normal) → ∀ (a b : G), ∃ j : ℤ, b * a = a ^ j * b := by

done