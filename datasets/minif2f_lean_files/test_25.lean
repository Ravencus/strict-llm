import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem unique_positive_integer_sum_of_digits : 
  ∃! (n : ℕ), Real.logb 2 (Real.logb 16 n) = Real.logb 4 (Real.logb 4 n) ∧ (n.digits.sum = 13) := by

done