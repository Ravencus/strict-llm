import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem value_of_fg2 : 
  (f g : ℝ → ℝ) (h₀ : ∀ x, f x = x + 1) (h₁ : ∀ x, g x = x ^ 2 + 3) : 
  f (g 2) = 8 := 
by
  have h₂ : g 2 = 2 ^ 2 + 3 := h₁ 2
  have h₃ : g 2 = 4 + 3 := by rw h₂
  have h₄ : g 2 = 7 := by norm_num at h₃
  have h₅ : f (g 2) = f 7 := by rw h₄
  have h₆ : f 7 = 7 + 1 := h₀ 7
  have h₇ : f 7 = 8 := by norm_num at h₆
  rw [h₅, h₇]

done