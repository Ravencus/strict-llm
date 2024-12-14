import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem ones_digit_of_product : (1 * 3 * 5 * 7 * 9 * 11 * 13) % 10 = 5 := by
  norm_num

done