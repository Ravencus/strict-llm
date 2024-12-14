import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem value_at_x_4 : (3 * 4 - 2) * (4 * 4 + 1) - (3 * 4 - 2) * 4 * 4 + 1 = 11 := by
  norm_num

done