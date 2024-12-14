import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem integer_satisfies_condition : 
  ∃ (n : ℕ), 0 ≤ n ∧ n < 101 ∧ 123456 ≡ n [MOD 101] ∧ n = 34 := by

done