import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem max_value_fraction : 
  ∀ t : ℝ, (2^t - 3*t)*t / 4^t ≤ 1/12 := by

done