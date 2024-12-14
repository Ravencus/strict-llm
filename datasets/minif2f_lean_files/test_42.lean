import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem expand_product : (x + 1) ^ 2 * x = x ^ 3 + 2 * x ^ 2 + x := by
  ring

done