import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem inequality_example : 
  ∀ (a b c d : ℝ), 0 < a ∧ 0 < b ∧ 0 < c ∧ 0 < d → 
  a^2 / b + b^2 / c + c^2 / d + d^2 / a ≥ a + b + c + d := 
by

done