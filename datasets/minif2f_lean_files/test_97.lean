import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem prod_inequality : ∀ (n : ℕ) (h₀ : n ≠ 0), (∏ k in Finset.range n, (1 + 1 / (k + 1)^3 : ℝ)) ≤ 3 - 1 / n := by

done