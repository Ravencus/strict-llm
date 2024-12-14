import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem expression_value : 
  (100^2 - 7^2) / (70^2 - 11^2) * ((70 - 11) * (70 + 11)) / ((100 - 7) * (100 + 7)) = 1 := by

done