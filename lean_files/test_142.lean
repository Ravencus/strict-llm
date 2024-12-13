import Mathlib

open Filter Set TopologicalSpace
open scoped Topology

def is_topology (X : Type*) (T : Set (Set X)) :=
  univ ∈ T ∧
  (∀ s t, s ∈ T → t ∈ T → s ∩ t ∈ T) ∧
  (∀s, (∀t ∈ s, t ∈ T) → sUnion s ∈ T)



theorem subbasis_generates_topology {X : Type*} (A : Set (Set X)) (hA : IsTopologicalBasis A) :
  generateFrom A = generateFrom (sInter {T | is_topology X T ∧ A ⊆ T}) := by

done