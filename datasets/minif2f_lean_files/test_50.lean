import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem sum_units_digits_multiples_of_3 : 
  (∑ k in Finset.Icc 0 16, (3 * k) % 10) = 78 := by

done