import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem minimum_value_of_f : 
  ∀ (x p : ℝ), 0 < p ∧ p ≤ x ∧ x ≤ 15 → 
  let f := λ x, abs (x - p) + abs (x - 15) + abs (x - p - 15) in 
  f x = 15 := 
by

done