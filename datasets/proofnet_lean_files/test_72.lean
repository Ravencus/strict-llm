import Mathlib

open Function Fintype Subgroup Ideal Polynomial Submodule Zsqrtd
open scoped BigOperators



theorem no_simple_group_of_order_pq {G : Type*} [Group G] [Fintype G] {p q : ℕ} (hp : Prime p) (hq : Prime q) (hG : card G = p * q) : IsSimpleGroup G → false := by

done