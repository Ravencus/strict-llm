import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators



theorem even_order_group_has_involution {G : Type*} [Group G] [Fintype G] (hG : Fintype.card G % 2 = 0) :
  ∃ a : G, a ≠ 1 ∧ a = a⁻¹

done