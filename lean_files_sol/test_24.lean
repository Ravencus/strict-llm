import Mathlib

open Topology Filter Real Complex TopologicalSpace Finset
open scoped BigOperators



theorem exercise_3_13
  (a b : ℕ → ℝ)
  (ha : ∃ y, (Tendsto (λ n => (∑ i in (range n), |a i|)) atTop (𝓝 y)))
  (hb : ∃ y, (Tendsto (λ n => (∑ i in (range n), |b i|)) atTop (𝓝 y))) :
  ∃ y, (Tendsto (λ n => (∑ i in (range n),
  λ i => (∑ j in range (i + 1), a j * b (i - j)))) atTop (𝓝 y)) :=by

done