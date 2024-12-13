import Mathlib

open Topology Filter Real Complex TopologicalSpace Finset
open scoped BigOperators



theorem bounded_uniformly_continuous_function (f : ℝ → ℝ) (E : Set ℝ) (h₁ : IsClosed E) (h₂ : ContinuousOn f E) : 
  UniformContinuousOn f E → Bornology.IsBounded (Set.image f E) := by

done