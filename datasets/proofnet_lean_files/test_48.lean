import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators



theorem nonabelian_groups_isomorphic {p q : ℕ} [Fact (p.Prime)] [Fact (q.Prime)] (hpq : p > q) (hq : q ∣ p - 1) 
  {G H : Type*} [Fintype G] [Fintype H] [Group G] [Group H] (hG : card G = p * q) (hH : card H = p * q) 
  (hG1 : IsEmpty (CommGroup G)) (hH1 : IsEmpty (CommGroup H)) : G ≃* H := by

done