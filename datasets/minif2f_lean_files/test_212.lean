import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem power_mean_inequality (a b : ℝ) (n : ℕ) (h₀ : 0 < a ∧ 0 < b) (h₁ : 0 < n) : 
  ( (a + b) / 2 ) ^ n ≤ (a ^ n + b ^ n) / 2 := by

done