import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem problem_statement : 
  ∀ (p q r : ℤ), 1 < p ∧ p < q ∧ q < r → (p - 1) * (q - 1) * (r - 1) ∣ p * q * r - 1 → 
  (p = 2 ∧ q = 4 ∧ r = 8) ∨ (p = 3 ∧ q = 5 ∧ r = 15) := by

done