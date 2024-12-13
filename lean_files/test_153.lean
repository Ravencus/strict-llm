import Mathlib

open Filter Set TopologicalSpace
open scoped Topology



theorem connected_intersects_boundary {X : Type*} [TopologicalSpace X] {A C : Set X} 
  (hA : A ⊆ X) (hC : IsConnected C) (hCA : C ∩ A ≠ ∅) (hCXA : C ∩ (X \ A) ≠ ∅) :
  C ∩ (TopologicalSpace.Bd A) ≠ ∅ := by

done