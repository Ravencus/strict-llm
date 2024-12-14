import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem exists_normal_not_characteristic : ∃ (N : Subgroup G), N.Normal ∧ ¬ N.Characteristic := by

done