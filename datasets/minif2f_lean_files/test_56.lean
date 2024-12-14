import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem f_of_1_is_9 : ∀ (f : ℝ → ℝ), (∀ x, f x = 5 * x + 4) → f 1 = 9 := by

done