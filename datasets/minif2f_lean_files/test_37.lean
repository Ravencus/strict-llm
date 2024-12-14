import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem xy_solutions : ∀ (x y : ℕ), x > 0 ∧ y > 0 ∧ x ^ (y ^ 2) = y ^ x → (x, y) = (1, 1) ∨ (x, y) = (16, 2) ∨ (x, y) = (27, 3) := by

done