import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem function_property_example : 
  ∀ (f : ℚ → ℚ) (h₁ : ∀ a b, 0 < a ∧ 0 < b → f (a * b) = f a + f b) 
    (h₂ : ∀ p : ℕ, Nat.Prime p → f p = p), 
  f (25 / 11) < 0 :=
begin
  intros f h₁ h₂,
  have h₃ : f 25 = f (5 * 5) := by rw [h₁ 5 5 (by norm_num)],
  rw [h₂ 5 (by norm_num)] at h₃,
  have h₄ : f 25 = 5 + 5 := h₃,
  have h₅ : f 11 = 11 := h₂ 11 (by norm_num),
  have h₆ : f (25 / 11) = f 25 - f 11 := by rw [h₁ 25 (1 / 11) (by norm_num)],
  rw [h₄, h₅] at h₆,
  norm_num at h₆,
  exact h₆,
end

done