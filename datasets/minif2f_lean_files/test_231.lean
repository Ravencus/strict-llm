import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem find_positive_solution : 
  ∃ x : ℝ, 0 < x ∧ 
  (1 / (x^2 - 10*x - 29) + 1 / (x^2 - 10*x - 45) - 2 / (x^2 - 10*x - 69) = 0) ∧ 
  x = 13 := 
by

done