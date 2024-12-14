import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem infinite_group_of_omega : 
  (Ω : Set ℕ) (h : Ω = {n : ℕ | n ≥ 1}) → Infinite (SymmetricGroup Ω) := by

done