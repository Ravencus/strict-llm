import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem log_expression_value : (Real.logb 2 80 / Real.logb 40 2) - (Real.logb 2 160 / Real.logb 20 2) = 2 := by

done