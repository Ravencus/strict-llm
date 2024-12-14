import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem find_y : ∃ y : ℝ, Real.sqrt (19 + 3 * y) = 7 ∧ y = 10 := by

done