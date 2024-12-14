import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem value_of_y_in_arithmetic_sequence : 
  ∀ y, (y + 6, 12, y) is an arithmetic sequence → y = 9 := by

done