import Mathlib

open Topology Filter Real Complex TopologicalSpace Finset
open scoped BigOperators



theorem exercise_5_7
  {f g : ℝ → ℝ} {x : ℝ}
  (hf' : DifferentiableAt ℝ f 0)
  (hg' : DifferentiableAt ℝ g 0)
  (hg'_ne_0 : deriv g 0 ≠ 0)
  (f0 : f 0 = 0) (g0 : g 0 = 0) :
  Tendsto (λ x => f x / g x) (𝓝 x) (𝓝 (deriv f x / deriv g x)) :=by

done