import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem daily_caloric_requirement : 
  ∀ (calories : ℕ), (calories = 40) → (calories = 2 * daily_requirement / 100) → daily_requirement = 2000 := 
by
  intros calories h₁ h₂
  rw h₁ at h₂
  have h₃ : 40 = 2 * daily_requirement / 100 := h₂
  have h₄ : 40 * 100 = 2 * daily_requirement := by linarith
  have h₅ : 4000 = 2 * daily_requirement := h₄
  have h₆ : daily_requirement = 4000 / 2 := by linarith
  exact h₆

done