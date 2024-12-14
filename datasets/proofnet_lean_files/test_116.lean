import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem abelian_group_of_order_pq_is_cyclic {G : Type*} [CommGroup G] [Fintype G] (h : Fintype.card G = p * q) (hpq : p ≠ q) (hp : Nat.Prime p) (hq : Nat.Prime q) : 
  ∃ g : G, ∀ x : G, ∃ n : ℕ, x = g ^ n

done