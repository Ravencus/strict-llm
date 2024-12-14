import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators



theorem homomorphism_normal_subgroup {G G' : Type*} [group G] [group G'] 
  (φ : G →* G') (hφ : function.surjective φ) {N : subgroup G} (hN : N.normal) : 
  (φ.map N).normal

done