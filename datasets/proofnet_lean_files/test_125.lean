import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem sylow_subgroup_unique {G : Type*} [Fintype G] [Group G] {p : ℕ} (hp : Nat.Prime p) 
  (P : Sylow p G) (hP : P.Normal) (H : Subgroup G) : 
  ∃! (Q : Sylow p H), Q.1 = P.1 ⊓ H

done