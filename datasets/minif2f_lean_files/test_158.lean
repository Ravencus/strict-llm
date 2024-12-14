import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem sum_of_final_three_digits_of_5_pow_100 : 
  ∃ n : ℕ, n = (5^100) % 1000 ∧ (n / 100 + (n / 10) % 10 + n % 10) = 13 := by

done