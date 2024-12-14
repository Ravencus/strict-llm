import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem value_of_expression : 
  (∀ x : ℝ, (h₀ : (real.sqrt 11) ^ (3 * x - 3) = 1 / 5) → 
  (real.sqrt 11) ^ (6 * x + 2) = 121 / 25) := by

done