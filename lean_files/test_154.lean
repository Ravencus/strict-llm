import Mathlib

open Filter Set TopologicalSpace
open scoped Topology



theorem quotient_map_connected (p : X → Y) (h₁ : IsQuotientMap p) 
  (h₂ : ∀ y, IsConnected (p ⁻¹' {y})) (h₃ : IsConnected Y) : IsConnected X := by

done