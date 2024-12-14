import Mathlib

open Complex Filter Function Metric Finset
open scoped BigOperators Topology



theorem exercise_1_19c (z : ℂ) (hz : abs z = 1) (hz2 : z ≠ 1) (s : ℕ → ℂ)
    (h : s = (λ n => ∑ i in (range n), i * z / i)) :
    ∃ z, Tendsto s atTop (𝓝 z) :=by

done