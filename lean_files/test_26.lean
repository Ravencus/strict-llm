import Mathlib

open Topology Filter Real Complex TopologicalSpace Finset
open scoped BigOperators



theorem counterexample_to_continuity (f : ℝ → ℝ) (h_lim : ∀ x : ℝ, Tendsto (λ h : ℝ, f (x + h) - f (x - h)) (𝓝 0) (𝓝 0)) : ¬ Continuous f := by

done