import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem value_of_sqrt_log_sum : 
  Real.sqrt (Real.log 6 / Real.log 2 + Real.log 6 / Real.log 3) = 
  Real.sqrt (Real.log 3 / Real.log 2) + Real.sqrt (Real.log 2 / Real.log 3) := by

done