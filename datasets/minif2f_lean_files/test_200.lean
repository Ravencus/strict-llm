import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem f_f_1_eq_3_div_7 : 
  (f : ℝ → ℝ) (h₀ : ∀ x, f x = 1 / (x + 2)) → f (f 1) = 3 / 7 := by

done