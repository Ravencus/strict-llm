import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators



theorem group_commutator_identity {G : Type*} [group G] (n : ℤ) (hn : n > 1)
  (h : ∀ (a b : G), (a * b) ^ n = a ^ n * b ^ n) :
  ∀ (a b : G), (a * b * a⁻¹ * b⁻¹) ^ (n * (n - 1)) = 1

done