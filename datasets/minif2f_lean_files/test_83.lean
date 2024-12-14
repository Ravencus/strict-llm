import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem positive_integers_satisfy : 
  (S : Finset ℕ) (∑ k in (f ⁻¹' {10}).toFinset, k) = 6 := by

done