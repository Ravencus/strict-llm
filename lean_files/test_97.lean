import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem residue_class_mul_assoc : ∀ (a b c : ℤ), (a * b) * c ≡ a * (b * c) [ZMOD n] := by

done