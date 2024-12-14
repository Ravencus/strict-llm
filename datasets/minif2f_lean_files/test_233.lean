import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem calculation : (n : ℤ) (_ : n = 11) → (1 / 4) ^ (n + 1) * 2 ^ (2 * n) = 1 / 4 := by

done