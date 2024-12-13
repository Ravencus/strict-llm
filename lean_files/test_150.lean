import Mathlib

open Filter Set TopologicalSpace
open scoped Topology



theorem quotient_map_of_section {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
  (p : X → Y) (hp : Continuous p)
  (f : Y → X) (hf : Continuous f)
  (hpf : ∀ y, p (f y) = y) : QuotientMap p

done