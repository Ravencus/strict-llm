import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem modulo_six_remainder : (∑ k in Finset.Icc 1 100, k) % 6 = 4 := by

done