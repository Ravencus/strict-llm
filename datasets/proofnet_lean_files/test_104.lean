import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem finite_group_abelian {G : Type*} [Group G] [Fintype G] 
  (σ : G ≃ G) (hσ : ∀ g : G, σ g = g ↔ g = 1) (hσ2 : σ.trans σ = Equiv.refl G) : 
  CommGroup G := by

done