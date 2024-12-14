import Mathlib

open Function Fintype Subgroup Ideal Polynomial Submodule Zsqrtd
open scoped BigOperators



theorem no_simple_group_of_order_224 : ¬ ∃ (G : Type*) [Fintype G] [Group G], Fintype.card G = 224 ∧ is_simple_group G := by

done