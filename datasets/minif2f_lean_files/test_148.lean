import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem infinite_solutions : ∀ m : ℕ, ∃ n : ℕ, m * n ≤ m + n := by

done