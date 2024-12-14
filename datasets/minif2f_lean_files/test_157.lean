import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem abc_value : 
  ∀ (a b c : ℝ), 0 < a ∧ 0 < b ∧ 0 < c ∧ 
  a * (b + c) = 152 ∧ b * (c + a) = 162 ∧ c * (a + b) = 170 → 
  a * b * c = 720 := 
by

done