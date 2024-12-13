import Mathlib

open Topology Filter Real Complex TopologicalSpace Finset
open scoped BigOperators



theorem nested_closed_bounded_sets_singleton {X : Type*} [MetricSpace X] [CompleteSpace X]
  (E : ℕ → Set X) (hE : ∀ n, IsClosed (E n) ∧ E n ≠ ∅ ∧ Bounded (E n))
  (hNested : ∀ n, E n ⊇ E (n + 1))
  (hDiam : Tendsto (λ n, diam (E n)) atTop (𝓝 0)) :
  ∃! x, x ∈ ⋂ n, E n

done