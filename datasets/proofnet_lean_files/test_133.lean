import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem quotient_ring_is_field_with_q_squared_elements 
  {q : ℤ} [Fact (q.Prime)] (hq : q ≡ 3 [ZMOD 4]) :
  let R := (GaussianInt ⧸ span ({⟨0, 1⟩} : Set GaussianInt)) in
  IsField R ∧ ∃ finR : Fintype R, @card R finR = q^2 := by

done