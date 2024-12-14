import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem n_pow_one_over_n_le_two_sub_one_over_n (n : ℕ) (h : 0 < n) : n^(1/n) ≤ 2 - 1/n := by

done