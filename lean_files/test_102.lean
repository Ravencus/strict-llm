import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem abelian_product_iff (A B : Type*) [CommGroup A] [CommGroup B] : 
  CommGroup (A × B) ↔ CommGroup A ∧ CommGroup B := by

done