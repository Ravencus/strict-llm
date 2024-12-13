import Mathlib

open Complex Filter Function Metric Finset
open scoped BigOperators Topology



theorem power_series_convergence : 
  ∀ (z : ℂ), abs z = 1 → z ≠ 1 → ∃ y, Tendsto (λ n, ∑ i in (range n), z^i / i) atTop (𝓝 y) := by

done