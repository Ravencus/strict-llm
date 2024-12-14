import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem patio_diagonal_squared : 
  ∃ (l w : ℝ), l * w = 180 ∧ 2 * (l + w) = 54 ∧ (l^2 + w^2 = 369) := by

done