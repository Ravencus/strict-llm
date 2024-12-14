import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem inequality_for_positive_reals (x y z : ℝ) (h₀ : 0 < x ∧ 0 < y ∧ 0 < z) : 
  9 / (x + y + z) ≤ 2 / (x + y) + 2 / (y + z) + 2 / (z + x) := by

done