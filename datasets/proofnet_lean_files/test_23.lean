import Mathlib

open Topology Filter Real Complex TopologicalSpace Finset
open scoped BigOperators



theorem convergence_implies_convergence_of_sqrt_div_n 
  (a : ℕ → ℝ) (h1 : ∃ y, Tendsto (λ n => (∑ i in (range n), a i)) atTop (𝓝 y)) 
  (ha : ∀ n, 0 ≤ a n) : 
  ∃ y, Tendsto (λ n => (∑ i in (range n), (sqrt (a i)) / i)) atTop (𝓝 y) := by

done