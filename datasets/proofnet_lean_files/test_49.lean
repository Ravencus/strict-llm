import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators



theorem normal_subgroup_intersection_trivial {G : Type*} [group G] 
  (A : subgroup G) [A.normal] {b : G} (hb : order_of b = p) (hbnA : b ∉ A) :
  A ⊓ subgroup.closure {b} = ⊥

done