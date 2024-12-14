import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem finite_abelian_group_subgroup_order {G : Type*} [CommGroup G] [Fintype G] :
  ∀ n : ℕ, n ∣ card G → ∃ (H : Subgroup G) (fH : Fintype H), @card H fH = n := by

done