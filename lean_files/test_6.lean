import Mathlib

open Complex Filter Function Metric Finset
open scoped BigOperators Topology



theorem integral_sin_over_x : ∫ x in (0 : ℝ)..(∞ : ℝ), Real.sin x / x = Real.pi / 2 := by

done