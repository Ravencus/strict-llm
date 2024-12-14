import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem find_abc : (3 * a + b + c = -3) ∧ (a + 3 * b + c = 9) ∧ (a + b + 3 * c = 19) → abc = -56 := by

done