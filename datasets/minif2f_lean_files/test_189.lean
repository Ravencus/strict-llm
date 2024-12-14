import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem value_of_f_at_3 : 
  (∀ x, f x = a * x ^ 4 - b * x ^ 2 + x + 5) → f (-3) = 2 → f 3 = 8 := 
by

done