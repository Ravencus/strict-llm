import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem find_n : ∃ n : ℕ, Nat.gcd n 40 = 10 ∧ Nat.lcm n 40 = 280 ∧ n = 70 := by

done