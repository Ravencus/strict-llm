import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem solve_for_a : 
  ∃ (a : ℝ), 
  (∃ (r : ℝ), (∀ k, (λ n, 6 * r ^ n) k = 6 * r ^ k) ∧ (∀ k, (λ n, (1 / b) * r ^ n) k = (1 / b) * r ^ k)) ∧ 
  a = 3 * Real.sqrt 2 := 
by

done