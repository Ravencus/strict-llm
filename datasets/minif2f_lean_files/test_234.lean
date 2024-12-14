import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem xyz_value : 
  ∀ (x y z : ℝ), 0 < x ∧ 0 < y ∧ 0 < z ∧ 
  (x + 1 / y = 4) ∧ 
  (y + 1 / z = 1) ∧ 
  (z + 1 / x = 7 / 3) → 
  x * y * z = 1 := 
by

done