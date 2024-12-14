import Mathlib

open Function Fintype Subgroup Ideal Polynomial Submodule Zsqrtd
open scoped BigOperators



theorem gauss_integer_ideal_contains_nonzero_integer 
  {R : Type*} [CommRing R] (I : Ideal R) (hI : I ≠ ⊥) : 
  ∃ n : ℤ, n ≠ 0 ∧ n ∈ I := by

done