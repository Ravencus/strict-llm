import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem least_possible_value_of_m_plus_n : 
  ∀ (m n : ℕ), gcd m n = 6 ∧ lcm m n = 126 → m + n = 60 := by

done