import Mathlib

open Filter Set TopologicalSpace
open scoped Topology



theorem exercise_28_6 {X : Type*} [MetricSpace X]
  [CompactSpace X] {f : X → X} (hf : Isometry f) :
  Function.Bijective f :=by

done