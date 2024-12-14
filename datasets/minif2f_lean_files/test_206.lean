import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem value_of_expression : 
  ∀ (m n k t : ℕ), 
  prime m ∧ prime n ∧ k > t ∧ 
  (∀ x, x^2 - m*x + n = 0 → x = k ∨ x = t) → 
  m^n + n^m + k^t + t^k = 20 := 
by

done