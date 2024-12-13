import Mathlib

open Real
open scoped BigOperators



theorem constant_function (f : ℝ → ℝ) (h : ∀ t x : ℝ, |f t - f x| ≤ |t - x|^2) : ∀ a b : ℝ, f a = f b

done