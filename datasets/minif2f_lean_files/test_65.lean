import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem determine_f_1982 : 
  (f : ℕ → ℕ) → 
  f 2 = 0 → 
  f 3 > 0 → 
  f 9999 = 3333 → 
  (∀ m n, f (m + n) - f m - f n = 0 ∨ f (m + n) - f m - f n = 1) → 
  f 1982 = 660 := 
by

done