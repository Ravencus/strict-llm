import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem invertible_function_example : 
  (σ : Equiv ℝ ℝ) → σ 2 = 4 ∧ σ.symm 2 = 4 → σ (σ 2) = 2 := by

done