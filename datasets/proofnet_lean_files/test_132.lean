import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem irreducibles_in_R (n : ℤ) (hn : squarefree n ∧ n > 3) : 
  Irreducible (2 : ℤ[√-n]) ∧ Irreducible (√-n : ℤ[√-n]) ∧ Irreducible (1 + √-n : ℤ[√-n]) := by

done