import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators



theorem characteristic_subgroup_of_abelian_group {G : Type*} [CommGroup G] 
  (p n m : ℕ) (hp : Nat.Prime p) (hpm : p ∣ m → False) 
  {H : Subgroup G} [Fintype H] [H.Normal] (hH : card H = p^n) 
  (hG : card G = p^n * m) : H.Characteristic := by

done