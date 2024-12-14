import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem sum_sqrt_inverse_lt_198 : ∑ k in finset.range 9999, (1 / real.sqrt (k + 2)) < 198 := by

done