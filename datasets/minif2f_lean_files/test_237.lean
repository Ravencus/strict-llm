import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem star_example : (3 : ℝ) ≠ (11 : ℝ) → (3 : ℝ) ∗ (11 : ℝ) = (1 / 33 : ℝ) := by

done