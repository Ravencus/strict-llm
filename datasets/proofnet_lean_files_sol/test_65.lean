import Mathlib

open Filter Real Function
open scoped Topology



theorem exercise_2_92 {α : Type*} [TopologicalSpace α]
  {s : ℕ → Set α}
  (hs : ∀ i, IsCompact (s i))
  (hs : ∀ i, (s i).Nonempty)
  (hs : ∀ i, (s i) ⊃ (s (i + 1))) :
  (⋂ i, s i).Nonempty :=by

done