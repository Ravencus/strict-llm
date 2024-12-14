import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem positive_real_numbers_logarithm :
  ∀ (x y : ℝ), x ≠ 1 ∧ y ≠ 1 ∧ Real.logb 2 x = Real.logb y 16 ∧ x * y = 64 →
  (Real.logb 2 (x / y))^2 = 20 := by

done