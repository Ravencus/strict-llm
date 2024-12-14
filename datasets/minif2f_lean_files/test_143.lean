import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem roots_of_polynomial : 
  ∀ (P : polynomial ℝ) (a b c : ℝ), 
  (∀ x, P x = x^3 + a*x^2 + b*x + c) ∧ 
  (P (cos (2 * π / 7)) = 0) ∧ 
  (P (cos (4 * π / 7)) = 0) ∧ 
  (P (cos (6 * π / 7)) = 0) → 
  a * b * c = 1 / 32 := 
by

done