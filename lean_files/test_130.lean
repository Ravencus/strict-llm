import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem nilpotent_unit {R : Type*} [comm_ring R] (h : 1 ≠ (0 : R)) (a : R) (ha : is_nilpotent a) :
  ∀ b : R, is_unit (1 - a * b)

done