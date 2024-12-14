import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem digit_for_multiple_of_11 : ∃ (b : ℕ), b < 10 ∧ (207 + b * 10) % 11 = 0 ∧ b = 5 := by

done