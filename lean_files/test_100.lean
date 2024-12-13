import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem order_of_inverse {G : Type*} [Group G] (x : G) : orderOf x = orderOf x⁻¹ := by

done