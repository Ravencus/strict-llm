import Mathlib

open Filter Set TopologicalSpace
open scoped Topology



theorem subspace_topology_inheritance {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y] 
  (hY : Y ⊆ X) (A : Set Y) : 
  (subspace_topology A Y) = (subspace_topology A X) := by

done