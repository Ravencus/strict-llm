import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem real_numbers_inequalities (a b c : ℝ) 
  (h₀ : a ≤ b ∧ b ≤ c) 
  (h₁ : a + b + c = 2) 
  (h₂ : a * b + b * c + c * a = 1) : 
  0 ≤ a ∧ a ≤ 1/3 ∧ 1/3 ≤ b ∧ b ≤ 1 ∧ 1 ≤ c ∧ c ≤ 4/3 := by

done