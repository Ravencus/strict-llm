import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem solve_congruence : ∃ n : ℕ, 2 * n % 47 = 15 ∧ n < 47 := by

done