import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators



theorem matrix_group_isomorphic_to_symmetric_group :
  let T := {A : matrix (fin 2) (fin 2) (zmod 2) // A.det ≠ 0} in
  T ≃* equiv.perm (fin 3) := by

done