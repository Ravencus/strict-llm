import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem remainder_of_f_94 : 
  (f : ℝ → ℝ) 
  (h₀ : ∀ x, f x + f (x - 1) = x^2) 
  (h₁ : f 19 = 94) : 
  f 94 % 1000 = 561 := by

done