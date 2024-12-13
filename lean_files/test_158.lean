import Mathlib

open Filter Set TopologicalSpace
open scoped Topology

def countably_compact (X : Type*) [TopologicalSpace X] :=
  ∀ U : ℕ → Set X,
  (∀ i, IsOpen (U i)) ∧ ((univ : Set X) ⊆ ⋃ i, U i) →
  (∃ t : Finset ℕ, (univ : Set X) ⊆ ⋃ i ∈ t, U i)

def limit_point_compact (X : Type*) [TopologicalSpace X] :=
  ∀ U : Set X, Infinite U → ∃ x ∈ U, ClusterPt x (𝓟 U)



theorem countably_compact_iff_limit_point_compact {X : Type*} [TopologicalSpace X] [T1Space X] :
  countably_compact X ↔ (∀ (A : Set X), Infinite A → ∃ (x : X), x ∈ closure A) := by

done