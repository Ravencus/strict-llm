import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem arithmetic_geometric_mean_example (x y : ℝ) 
  (h₁ : (x + y) / 2 = 7) 
  (h₂ : real.sqrt (x * y) = real.sqrt 19) : 
  x^2 + y^2 = 158 := 
by
  have h₃ : x + y = 14 := by linarith
  have h₄ : x * y = 19 := by rw [←real.sqrt_inj (mul_self_nonneg x) (mul_self_nonneg y), h₂, real.sqrt_mul_self (le_of_lt (real.sqrt_pos.2 (by norm_num)))]
  have h₅ : (x + y)^2 = x^2 + 2*x*y + y^2 := by ring
  rw [h₃, h₄] at h₅
  linarith

done