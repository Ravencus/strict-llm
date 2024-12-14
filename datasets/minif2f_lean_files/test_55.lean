import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem problem_statement : 
  ∀ (m n : ℝ) (a b c : ℚ), 
  (0 < m ∧ 0 < n) → 
  (m^3 = 2) → 
  (n^3 = 4) → 
  (a + b * m + c * n = 0) → 
  (a = 0 ∧ b = 0 ∧ c = 0) := 
by

done