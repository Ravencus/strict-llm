import Mathlib

open Filter Set TopologicalSpace
open scoped Topology



theorem connected_union_of_connected_intersections 
  {X : Type*} [TopologicalSpace X] 
  {A : Set X} (hA : IsConnected A) 
  {Aα : ℕ → Set X} (hAα : ∀ n, IsConnected (Aα n)) 
  (hAn : ∀ n, A ∩ Aα n ≠ ∅) : 
  IsConnected (A ∪ ⋃ n, Aα n) := by

done