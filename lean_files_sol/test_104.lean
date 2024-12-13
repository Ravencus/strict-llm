import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem exercise_1_6_23 {G : Type*}
  [Group G] (σ : MulAut G) (hs : ∀ g : G, σ g = 1 → g = 1)
  (hs2 : ∀ g : G, σ (σ g) = g) :
  ∀ x y : G, x*y = y*x :=by

done