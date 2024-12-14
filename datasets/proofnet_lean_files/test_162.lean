import Mathlib

open Filter Set TopologicalSpace
open scoped Topology



theorem regular_space_disjoint_neighborhoods {X : Type*} [TopologicalSpace X] [RegularSpace X] :
  ∀ (x y : X), x ≠ y → ∃ (U V : Set X), IsOpen U ∧ IsOpen V ∧ x ∈ U ∧ y ∈ V ∧ closure U ∩ closure V = ∅ :=
by

done