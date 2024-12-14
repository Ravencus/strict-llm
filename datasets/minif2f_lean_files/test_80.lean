import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem convert_852_base9_to_base10 : 8 * 9^2 + 5 * 9 + 2 = 695 := by
  norm_num

done