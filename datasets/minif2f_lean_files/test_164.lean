import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem solution_count : 
  ∃! (x : ℝ), 0 ≤ x ∧ x ≤ Real.pi ∧ 
  Real.sin ((Real.pi / 2) * Real.cos x) = Real.cos ((Real.pi / 2) * Real.sin x)

done