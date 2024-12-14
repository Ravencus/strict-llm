import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem breath_holding_competition :
  ∃ a b c d : ℚ,
    (b + c + d = 3 * a) ∧
    (a + c + d = 4 * b) ∧
    (a + b + d = 2 * c) ∧
    (8 * a + 10 * b + 6 * c = 24) ∧
    (let d_frac := d in d_frac.num + d_frac.denom = 28) := by
-- Proof goes here

done