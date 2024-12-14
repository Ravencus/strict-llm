import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem units_digit_of_sum_of_squares : 
  (∑ k in Finset.Icc 1 9, k^2) % 10 = 5 := by

done