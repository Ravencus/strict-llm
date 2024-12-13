import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem subgroup_of_index_p_is_normal 
  {p : ℕ} (hp : Nat.Prime p) 
  {G : Type*} [Group G] [Fintype G] 
  {α : ℕ} (hα : α > 0) (hG : card G = p^α) 
  {H : Subgroup G} [Fintype H] (hH : card H = card G / p) : 
  H.Normal := by

done