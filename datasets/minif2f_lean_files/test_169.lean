import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem inequality_for_real_and_natural_numbers (x : ℝ) (n : ℕ) (h : x > -1) : (1 + n * x) ≤ (1 + x) ^ n := by

done