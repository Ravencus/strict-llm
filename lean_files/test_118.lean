import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem subgroup_normal_of_characteristic_and_normal {G : Type*} [Group G] (H K : Subgroup G) 
  (hHK : H ≤ K) (hH_char : H.Characteristic) (hK_norm : K.Normal) : H.Normal := by

done