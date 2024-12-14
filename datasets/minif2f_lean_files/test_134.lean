import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem find_inverse : ∃ (n : ℕ), 0 ≤ n ∧ n < 1399 ∧ n * 160 % 1399 = 1 := by

done