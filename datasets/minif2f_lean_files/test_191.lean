import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem remainder_of_power_mod : ∀ (n : ℕ), 3 ^ (2 ^ n) - 1 ≡ 2 ^ (n + 2) [MOD 2 ^ (n + 3)] := by

done