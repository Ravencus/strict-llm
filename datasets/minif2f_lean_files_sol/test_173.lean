import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem algebra_amgm_sum1toneqn_prod1tonleq1 (a : ℕ → NNReal) (n : ℕ)
    (h₀ : (∑ x in Finset.range n, a x) = n) : (∏ x in Finset.range n, a x) ≤ 1 := by


done