import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem group_of_order_351_has_normal_sylow_subgroup :
  ∃ (G : Type*) [Group G] [Fintype G] (hG : card G = 351), ∃ (p : ℕ) (P : Sylow p G), P.Normal := by

done