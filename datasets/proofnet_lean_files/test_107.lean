import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem maximal_subgroup_of_cyclic_group {G : Type*} [Group G] [Fintype G] (H : Subgroup G) (n : ℕ) :
  (∃ x : G, G = Subgroup.closure {x} ∧ Fintype.card G = n ∧ 1 ≤ n) →
  (H = Subgroup.closure {x ^ p} ∧ Nat.Prime p ∧ p ∣ n) ↔
  (∀ K : Subgroup G, H ≤ K → K = ⊤ ∨ K = H) := by

done