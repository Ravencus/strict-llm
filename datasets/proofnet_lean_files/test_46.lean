import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators



theorem finite_group_automorphism_involution {G : Type*} [Group G] [Fintype G] (ϕ : G ≃* G) 
  (h : ∃ S : Finset G, S.card > 3 * Fintype.card G / 4 ∧ ∀ x ∈ S, ϕ x = x⁻¹) : 
  ∀ y : G, ϕ y = y⁻¹ :=
begin
  -- Proof goes here
end

done