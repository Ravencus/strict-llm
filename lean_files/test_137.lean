import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem polynomial_irreducible : Irreducible (X ^ 2 - (sqrt 2) : Polynomial (ℤ[√2])) := by

done