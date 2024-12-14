import Mathlib

open Topology Filter Real Complex TopologicalSpace Finset
open scoped BigOperators



theorem exercise_3_7
  (a : ℕ → ℝ)
  (h : ∃ y, (Tendsto (λ n => (∑ i in (range n), a i)) atTop (𝓝 y))) :
  ∃ y, Tendsto (λ n => (∑ i in (range n), sqrt (a i) / n)) atTop (𝓝 y) :=by

done