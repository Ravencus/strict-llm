import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem expression_factorization : 
  ∃ A B : ℤ, (10 * x^2 - x - 24 = (A * x - 8) * (B * x + 3)) ∧ (A * B + B = 12) := by

done