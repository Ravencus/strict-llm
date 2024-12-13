import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem normal_intersection {G : Type*} [group G] {H K : subgroup G} [normal H] [normal K] : 
  normal (H ⊓ K)

done