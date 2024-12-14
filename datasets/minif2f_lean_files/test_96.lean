import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem smallest_positive_integer : 
  let r := 1342 % 13 in
  ∃ n : ℕ, n > 0 ∧ n % 1342 = 0 ∧ n % 13 < r ∧ n = 6710 := by

done