import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem subgroup_of_rationals (H : add_subgroup ℚ) (h : ∀ x ∈ H, x ≠ 0 → 1 / x ∈ H) : H = ⊥ ∨ H = ⊤ := by

done