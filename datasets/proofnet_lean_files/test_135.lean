import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem irreducible_polynomial : Irreducible (X^4 - 4*X^3 + 6 : Polynomial ℤ) := by

done