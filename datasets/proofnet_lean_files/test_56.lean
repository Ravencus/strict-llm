import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem irreducible_and_isomorphic_fields : 
  let F := ZMod 7
  let p : Polynomial F := X^3 - 2
  let q : Polynomial F := X^3 + 2
  Irreducible p ∧ Irreducible q ∧ Nonempty (F[X] ⧸ Ideal.span {p} ≃+* F[X] ⧸ Ideal.span {q}) := by

done