import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem sum_not_divisible_by_5 (n : ℕ) (h₀ : n ≥ 0) : ¬ (5 ∣ ∑ k in Finset.range (n + 1), (Nat.choose (2 * n + 1) (2 * k + 1)) * 2 ^ (3 * k)) := by

done