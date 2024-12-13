import Mathlib

open Topology Filter Real Complex TopologicalSpace Finset
open scoped BigOperators



theorem real_function_inequality 
  {f : ℝ → ℝ} 
  (hf1 : DifferentiableOn ℝ f (Set.Icc (-1 : ℝ) 1))
  (hf2 : DifferentiableOn ℝ (deriv f) (Set.Icc (-1 : ℝ) 1))
  (hf3 : DifferentiableOn ℝ (deriv (deriv f)) (Set.Icc (-1 : ℝ) 1))
  (hf4 : f (-1) = 0)
  (hf5 : f 0 = 0)
  (hf6 : f 1 = 1)
  (hf7 : deriv f 0 = 0) :
  ∃ x ∈ Set.Ioo (-1 : ℝ) 1, deriv (deriv (deriv f)) x ≥ 3 :=
begin
  -- Proof goes here
end

done