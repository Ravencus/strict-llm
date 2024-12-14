import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem sum_of_solutions : ∀ x, (x + 3)^2 = 121 → ∃ a b, a ≠ b ∧ (x = a ∨ x = b) ∧ a + b = -6 := by

done