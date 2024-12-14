import Mathlib

open Topology Filter Real Complex TopologicalSpace Finset
open scoped BigOperators



theorem differentiable_limit_zero {f : ℝ → ℝ} 
  (hf' : DifferentiableOn ℝ f (Set.Ioi 0)) 
  (hf'' : ∀ x, deriv f x → 0 as x → ∞) :
  ∀ ε > 0, ∃ N, ∀ x > N, abs (f (x + 1) - f x) < ε :=
begin
  -- Proof goes here
end

done