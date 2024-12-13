import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators



theorem permutations_no_common_disturbance {α : Type*} [fintype α] 
  (σ τ : equiv.perm α) (h_disturb : ∀ x, σ x ≠ τ x) (hST : σ * τ = equiv.refl α) : 
  σ = equiv.refl α ∧ τ = equiv.refl α

done