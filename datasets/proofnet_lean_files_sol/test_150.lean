import Mathlib

open Filter Set TopologicalSpace
open scoped Topology



theorem exercise_22_2a {X Y : Type*} [TopologicalSpace X]
  [TopologicalSpace Y] (p : X → Y) (h : Continuous p) :
  QuotientMap p ↔ ∃ (f : Y → X), Continuous f ∧ p ∘ f = id :=by

done