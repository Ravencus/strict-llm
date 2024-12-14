import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem fermats_little_theorem {p : ℕ} (hp : Nat.Prime p) (a : ℤ) : a^p ≡ a [ZMOD p] := by

done