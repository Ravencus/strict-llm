import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem min_value_of_quadratic : ∃ x, x = 7 ∧ ∀ y, (y - 7)^2 + 3 ≥ (x - 7)^2 + 3 := by

done