import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem euler_polynomial_common_factor : 
  ∃ n : ℕ, n > 0 ∧ gcd (n^2 - n + 41) ((n+1)^2 - (n+1) + 41) > 1 ∧ n = 41 := 
by

done