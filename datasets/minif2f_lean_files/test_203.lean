import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem consecutive_even_integers_product : 
  ∃ n : ℤ, (n * (n + 2) = 288) ∧ (n + 2 = 18) := by

done