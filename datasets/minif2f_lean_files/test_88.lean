import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem solve_system : 
  ∀ (f z : ℤ), f + 3 * z = 11 ∧ 3 * (f - 1) - 5 * z = -68 → f = -10 ∧ z = 7 := by

done