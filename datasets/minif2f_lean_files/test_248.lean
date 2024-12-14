import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem simplify_expression : 
  ∀ (x : ℝ) (h₀ : x ≠ 0), (12 / (x * x)) * (x^4 / (14 * x)) * (35 / (3 * x)) = 10 := 
by

done