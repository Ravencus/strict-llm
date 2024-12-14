import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators



theorem group_of_order_9_abelian (G : Type*) [Group G] [Fintype G] (hG : card G = 9) : CommGroup G := by

done