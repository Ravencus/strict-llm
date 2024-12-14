import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem product_of_real_roots : 
  ∀ (x : ℝ), x^2 + 18*x + 30 = 2 * Real.sqrt (x^2 + 18*x + 45) → 
  ∃ (a b : ℝ), a ≠ b ∧ (x = a ∨ x = b) ∧ a * b = 20 := 
by

done