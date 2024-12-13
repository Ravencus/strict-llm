import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem polynomial_zero_divisor_iff_nonzero_b {R : Type*} [comm_ring R] {p : polynomial R} :
  (∃ q : polynomial R, q ≠ 0 ∧ p * q = 0) ↔ (∃ b : R, b ≠ 0 ∧ b • p = 0)

done