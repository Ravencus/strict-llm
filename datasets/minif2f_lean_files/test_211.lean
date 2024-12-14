import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem integer_values_satisfying_abs_x_lt_3pi : 
  ∃ (S : Finset ℤ), S.card = 19 ∧ ∀ x ∈ S, |x| < 3 * Real.pi := by

done