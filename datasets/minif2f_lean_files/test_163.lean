import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem imo_2001_sum : 
  ∃ (I M O : ℕ), I ≠ M ∧ M ≠ O ∧ I ≠ O ∧ I * M * O = 2001 ∧ I + M + O = 671 := by

done