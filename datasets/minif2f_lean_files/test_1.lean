import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem ab_abs_diff_le_one {a b : ℝ} (h₀ : a ^ 2 + b ^ 2 = 1) : ab + |a - b| ≤ 1 := by

done