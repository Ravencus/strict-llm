import Mathlib

open Complex Filter Function Metric Finset
open scoped BigOperators Topology



theorem power_series_not_converge_on_unit_circle : 
  ¬ ∀ (z : ℂ), abs z = 1 → ∃ y, Tendsto (λ n, ∑ i in (range n), i * z ^ i) atTop (𝓝 y) := by

done