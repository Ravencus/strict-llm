import Mathlib

open Complex Filter Function Metric Finset
open scoped BigOperators Topology



theorem exercise_1_19a (z : ℂ) (hz : abs z = 1) (s : ℕ → ℂ)
    (h : s = (λ n => ∑ i in (range n), i * z ^ i)) :
    ¬ ∃ y, Tendsto s atTop (𝓝 y) :=by

done