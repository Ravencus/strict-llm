import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem intersection_sum_of_coordinates : 
  ∃ A : ℝ × ℝ, (3 * A.2 = A.1) ∧ (2 * A.1 + 5 * A.2 = 11) ∧ (A.1 + A.2 = 4) := by

done