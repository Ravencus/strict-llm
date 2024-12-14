import Mathlib

open Filter Set TopologicalSpace
open scoped Topology



theorem exercise_24_3a [TopologicalSpace I] [CompactSpace I]
  (f : I → I) (hf : Continuous f) :
  ∃ (x : I), f x = x :=by

done