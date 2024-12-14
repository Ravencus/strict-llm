import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem find_ordered_pair : ∃ (a b : ℝ), 3 * a + 2 * b = 5 ∧ a + b = 2 ∧ a = 1 ∧ b = 1 := by

done