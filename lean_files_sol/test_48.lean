import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators



def exercise_2_8_15 {G H: Type*} [Fintype G] [Group G] [Fintype H]
  [Group H] {p q : ℕ} (hp : Nat.Prime p) (hq : Nat.Prime q)
  (h : p > q) (h1 : q ∣ p - 1) (hG : card G = p*q) (hH : card G = p*q) :
  G ≃* H :=by

done