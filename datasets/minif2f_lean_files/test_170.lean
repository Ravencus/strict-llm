import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem find_c_value : 
  ∃ c : ℝ, (∀ x, f x = c * x^3 - 9 * x + 3) ∧ f 2 = 9 ∧ c = 3 := 
by

done