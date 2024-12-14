import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem prod_inequality (n : ℕ) : (∏ k in finset.range n, (1 + 1/2^k)) < 5/2 := by

done