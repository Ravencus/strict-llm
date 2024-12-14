import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem tan_cos_solution_count : 
  ∀ (x : ℝ), 0 ≤ x ∧ x ≤ 2 * Real.pi → 
  (∃! x, Real.tan (2 * x) = Real.cos (x / 2)) := by

done