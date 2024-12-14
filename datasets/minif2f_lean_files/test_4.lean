import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem log_z_w : 
  ∀ (x y z w : ℝ), 
  (1 < x ∧ 1 < y ∧ 1 < z) → 
  (0 < w) → 
  (Real.logb x w = 24) → 
  (Real.logb y w = 40) → 
  (Real.logb (x * y * z) w = 12) → 
  Real.logb z w = 60 := 
by

done