import Mathlib

open Fintype Complex Polynomial LinearMap FiniteDimensional Module Module.End
open scoped BigOperators



theorem constant_function (f : ℝ → ℝ) (h : ∀ x y : ℝ, |f x - f y| ≤ (x - y)^2) : ∀ x y : ℝ, f x = f y

done