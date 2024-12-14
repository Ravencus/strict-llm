import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem real_number_cubed_identity (r : ℝ) (h : r^(1/3) + 1/r^(1/3) = 3) : r^3 + 1/r^3 = 5778 := by

done