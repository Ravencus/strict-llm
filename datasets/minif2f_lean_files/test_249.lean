import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem remainder_zero_if_multiple_of_three (n : ℕ) (h₀ : 3 ∣ n) : ((n + 4) + (n + 6) + (n + 8)) % 9 = 0 := by

done