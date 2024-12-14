import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem calculate_sqrt_product : 
  (∀ (x : ℝ), sqrt(60 * x) * sqrt(12 * x) * sqrt(63 * x) = 36 * x * sqrt(35 * x)) := 
by

done