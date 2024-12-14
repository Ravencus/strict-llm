import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem fraction_value : 
  (∀ (x y z : ℝ), 2 * x = 5 * y ∧ 7 * y = 10 * z → z / x = 7 / 25) := 
by
  intros x y z h
  cases h with h₁ h₂
  have h₃ : y = 2 * x / 5 := by linarith
  have h₄ : z = 7 * y / 10 := by linarith
  rw [h₃, h₄]
  field_simp
  ring

done