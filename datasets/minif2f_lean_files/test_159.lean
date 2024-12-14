import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem gcd_lcm_min_sum : ∀ (m n : ℕ), nat.gcd m n = 8 ∧ nat.lcm m n = 112 → m + n = 72 := by

done