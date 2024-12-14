import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem smallest_integer : ∃ n : ℕ, n > 1 ∧ n = 4096 ∧ ∃ a b : ℕ, n = a^3 ∧ n = b^4 := by

done