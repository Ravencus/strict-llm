import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem normal_subgroup_prime_index {G : Type*} [Group G] [Fintype G] 
  {H : Subgroup G} [Fintype H] [H.Normal] (hH : card (G ⧸ H) = p) :
  ∀ {K : Subgroup G}, K ≤ H ∨ (G = H ⊔ K ∧ card (K ⧸ (K ⊓ H)) = p) := by

done