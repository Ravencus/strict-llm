import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem modulo_4_remainder : (∑ k in Finset.Icc 1 12, k) % 4 = 2 := by

done