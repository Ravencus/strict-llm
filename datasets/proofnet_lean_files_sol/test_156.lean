import Mathlib

open Filter Set TopologicalSpace
open scoped Topology



theorem exercise_25_9 {G : Type*} [TopologicalSpace G] [Group G]
  [TopologicalGroup G] (C : Set G) (h : C = connectedComponent 1) :
  IsNormalSubgroup C :=by

done