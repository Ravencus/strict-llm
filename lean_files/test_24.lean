import Mathlib

open Topology Filter Real Complex TopologicalSpace Finset
open scoped BigOperators



theorem cauchy_product_of_absolutely_convergent_series_converges_absolutely :
  ∀ (a b : ℕ → ℂ), (∃ L, ∑' n, abs (a n) < L) → (∃ M, ∑' n, abs (b n) < M) →
  ∃ N, ∑' n, abs (∑ k in finset.range (n + 1), a k * b (n - k)) < N := by

done