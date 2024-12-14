import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators



theorem group_abelian_if_power_property :
  ∀ {G : Type*} [Group G],
  (∀ (a b : G), (a * b) ^ 3 = a ^ 3 * b ^ 3 ∧ (a * b) ^ 4 = a ^ 4 * b ^ 4 ∧ (a * b) ^ 5 = a ^ 5 * b ^ 5) →
  CommGroup G :=
by

done