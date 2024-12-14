import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem abcd_product : 
  (∀ a b c d : ℝ, 4^a = 5 ∧ 5^b = 6 ∧ 6^c = 7 ∧ 7^d = 8 → a * b * c * d = 3 / 2) := 
by
  intros a b c d h
  have h₁ : a = real.log 5 / real.log 4 := by rw [← real.rpow_eq_log_rpow, h.1]
  have h₂ : b = real.log 6 / real.log 5 := by rw [← real.rpow_eq_log_rpow, h.2.1]
  have h₃ : c = real.log 7 / real.log 6 := by rw [← real.rpow_eq_log_rpow, h.2.2.1]
  have h₄ : d = real.log 8 / real.log 7 := by rw [← real.rpow_eq_log_rpow, h.2.2.2]
  rw [h₁, h₂, h₃, h₄]
  field_simp
  rw [← real.log_mul, ← real.log_mul, ← real.log_mul, ← real.log_mul]
  norm_num

done