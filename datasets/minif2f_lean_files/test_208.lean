import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem sequence_problem : 
  ∀ (a b : ℝ), 
  (∀ n, (a (n + 1), b (n + 1)) = (sqrt 3 * a n - b n, sqrt 3 * b n + a n)) → 
  (a 100, b 100) = (2, 4) → 
  a 1 + b 1 = 1 / 2 ^ 98 := 
by

done