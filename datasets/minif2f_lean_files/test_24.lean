import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem value_of_expression : 
  let a := -1, b := 5 in -a - b^2 + 3*a*b = -39 := by
  simp [a, b]
  norm_num

done