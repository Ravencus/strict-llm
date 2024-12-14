import Mathlib

open Topology Filter Real Complex TopologicalSpace Finset
open scoped BigOperators



theorem irrational_product (y : ℚ) (hy : y ≠ 0) (x : ℝ) (hx : Irrational x) : Irrational (y * x) := by

done