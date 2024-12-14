import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem floor_sum_example : 
  let N := 1 / 3 in 
  (Int.floor (10 * N) + Int.floor (100 * N) + Int.floor (1000 * N) + Int.floor (10000 * N)) = 3702 := by

done