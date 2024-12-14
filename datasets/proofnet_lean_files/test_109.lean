import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem finite_subgroups_rel_prime_inter_trivial {G : Type*} [Group G] [Fintype G] 
  (H K : Subgroup G) (h_rel_prime : Nat.Coprime (Fintype.card H) (Fintype.card K)) : 
  H ⊓ K = ⊥ := by

done