import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators



theorem sylow_subgroup_invariant_under_automorphisms 
  {G : Type*} [Fintype G] [Group G] {p : ℕ} (hp : Nat.Prime p) 
  {P : Sylow p G} (hP : P.Normal) : 
  ∀ (φ : G ≃* G), φ.to_monoid_hom '' P = P := 
by

done