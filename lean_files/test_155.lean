import Mathlib

open Filter Set TopologicalSpace
open scoped Topology



theorem fixed_point_theorem {X : Type*} [TopologicalSpace X] {f : X → X} (hf : Continuous f) (hX : X = set.Icc 0 1) :
  ∃ x, f x = x := by

done