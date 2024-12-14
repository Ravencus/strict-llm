import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem smallest_value_of_X : 
  ∃ X : ℕ, 0 < X ∧ (∃ k : ℕ, X = 3 * k + 2) ∧ (∃ m : ℕ, (X % 10) = ((5 * m + 4) % 10)) ∧ X = 14 := by

done