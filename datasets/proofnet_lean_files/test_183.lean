import Mathlib

open scoped BigOperators



theorem real_function_inequality 
  (f : ℝ → ℝ) 
  (hf : ContDiff ℝ 3 f) 
  (hf_pos : ∀ x, 0 < f x ∧ 0 < deriv f x ∧ 0 < deriv^[2] f x ∧ 0 < deriv^[3] f x) 
  (hf_ineq : ∀ x, deriv^[3] f x ≤ f x) : 
  ∀ x, deriv f x < 2 * f x

done