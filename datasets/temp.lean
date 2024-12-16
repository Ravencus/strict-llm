import analysis.complex.basic
import analysis.calculus.fderiv

open set

theorem constant_if_im_constant {f : ℂ → ℂ} (Ω : set ℂ) (h : is_open Ω) 
  (hf : differentiable_on ℂ f Ω) (hc : ∃ (c : ℝ), ∀ z ∈ Ω, (f z).im = c) : 
  ∀ a b, a ∈ Ω → b ∈ Ω → f a = f b :=
begin
  sorry
end