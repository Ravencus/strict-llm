import Mathlib

open Real
open scoped BigOperators



theorem integral_sin_over_x2_plus_a2 : 
  ∀ (a : ℝ) (ha : 0 < a), Tendsto (λ y => ∫ x in -y..y, x * Real.sin x / (x ^ 2 + a ^ 2)) atTop (𝓝 (Real.pi * Real.exp (-a))) := by

done