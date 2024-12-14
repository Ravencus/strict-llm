import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem theta_values_count : 
  ∃ (S : Finset ℝ), 
    (∀ (x : ℝ), x ∈ S ↔ (0 < x ∧ x ≤ 2 * Real.pi) ∧ (1 - 3 * Real.sin x + 5 * Real.cos (3 * x) = 0)) ∧ 
    S.card = 6 := 
by

done