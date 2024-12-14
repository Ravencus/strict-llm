import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem five_plus_500_percent_of_10_is_110_percent_of_50 : 
  5 + (500 / 100) * 10 = (110 / 100) * 50 := by
  norm_num

done