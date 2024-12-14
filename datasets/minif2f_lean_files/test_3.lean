import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem no_integers_solution : ¬ ∃ (x y : ℤ), 4 * x^3 - 7 * y^3 = 2003 := by

done