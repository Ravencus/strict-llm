import Mathlib

open Filter Set TopologicalSpace
open scoped Topology



theorem metrizable_union_of_metrizable_subspaces 
  {X : Type*} [TopologicalSpace X] [CompactSpace X] [T2Space X]
  (X1 X2 : Set X) (hX1 : IsClosed X1) (hX2 : IsClosed X2)
  (hUnion : X1 ∪ X2 = Set.Univ) 
  [MetricSpace X1] [MetricSpace X2] :
  MetrizableSpace X := by

done