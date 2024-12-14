import Mathlib

open Complex Filter Function Metric Finset
open scoped BigOperators Topology



theorem holomorphic_im_constant_then_constant 
  {f : ℂ → ℂ} (Ω : Set ℂ) (h : IsOpen Ω) (hf : DifferentiableOn ℂ f Ω) 
  (hc : ∃ (c : ℝ), ∀ z ∈ Ω, (f z).im = c) : 
  ∀ a b ∈ Ω, f a = f b := by

done