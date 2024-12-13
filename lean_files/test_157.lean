import Mathlib

open Filter Set TopologicalSpace
open scoped Topology



theorem perfect_map_compactness {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y] 
  (p : X → Y) (h₁ : Continuous p) (h₂ : Function.Surjective p) (h₃ : IsClosedMap p)
  (h₄ : ∀ y : Y, IsCompact (p ⁻¹' {y})) (hY : CompactSpace Y) : CompactSpace X

done