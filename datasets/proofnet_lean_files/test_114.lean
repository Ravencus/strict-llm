import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem finite_index_normal_subgroup {G : Type*} [fintype G] [group G] 
  {H : subgroup G} (n : ℕ) (hn : n > 0) (hH : card H ≠ card G - 1) :
  ∃ (K : subgroup G), K.normal ∧ K ≤ H ∧ card (quotient_group.quotient K) ≤ nat.factorial n :=
by

done