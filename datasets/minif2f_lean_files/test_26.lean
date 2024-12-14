import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem inequality_solution : ∀ x : ℝ, (4 * x^2) / (1 - Real.sqrt (2 * x + 1))^2 < 2 * x + 9 := by

done