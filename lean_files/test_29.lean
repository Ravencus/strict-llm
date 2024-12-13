import Mathlib

open Topology Filter Real Complex TopologicalSpace Finset
open scoped BigOperators



theorem existence_of_non_extendable_continuous_function :
  ∃ (E : Set ℝ) (f : ℝ → ℝ), IsClosed E ∧ ContinuousOn f E ∧ ¬ ∃ (g : ℝ → ℝ), Continuous g ∧ ∀ x ∈ E, f x = g x := by

done