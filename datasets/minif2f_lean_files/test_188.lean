import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem find_f_84 : (f : ℤ → ℤ) (h₁ : ∀ n, n ≥ 1000 → f n = n - 3) (h₂ : ∀ n, n < 1000 → f n = f (f (n + 5))) : f 84 = 997 := by

done