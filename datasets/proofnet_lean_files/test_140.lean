import Mathlib

open Filter Set TopologicalSpace
open scoped Topology

def is_topology (X : Type*) (T : Set (Set X)) :=
  univ ∈ T ∧
  (∀ s t, s ∈ T → t ∈ T → s ∩ t ∈ T) ∧
  (∀s, (∀t ∈ s, t ∈ T) → sUnion s ∈ T)



theorem topology_union_not_topology {X I : Type*} (T : I → set (set X)) (h : ∀ i, is_topology X (T i)) : ¬ is_topology X (⋃ i, T i) := by

done