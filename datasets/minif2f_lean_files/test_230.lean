import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem real_number_inequality (x : ℝ) (h : |x - 1| + |x| + |x + 1| = x + 2) : 0 ≤ x ∧ x ≤ 1 := by

done