import Mathlib

open Topology Filter Real Complex TopologicalSpace Finset
open scoped BigOperators



theorem limit_quotient_rule 
  (hf : DifferentiableAt ℝ f x) 
  (hg : DifferentiableAt ℝ g x) 
  (hg_ne_zero : deriv g x ≠ 0) 
  (hf_zero : f x = 0) 
  (hg_zero : g x = 0) : 
  tendsto (λ t, f t / g t) (𝓝 x) (𝓝 (deriv f x / deriv g x)) := 
by
  -- Proof goes here

done