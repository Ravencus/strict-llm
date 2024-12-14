import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem find_3x2y2 : ∃ (x y : ℤ), y^2 + 3*x^2*y^2 = 30*x^2 + 517 ∧ 3*x^2*y^2 = 588 := by

done