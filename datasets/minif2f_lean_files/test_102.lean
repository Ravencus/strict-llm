import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem least_positive_integer_divides_factorial : 
  ∃ (n : ℕ), 0 < n ∧ 80325 ∣ n! ∧ n = 17 := by

done