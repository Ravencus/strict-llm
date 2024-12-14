import Mathlib

open Filter Set TopologicalSpace
open scoped Topology



theorem open_map_restriction {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
  (p : X → Y) (hp : IsOpenMap p) (A : Set X) (hA : IsOpen A) :
  IsOpenMap (p.restrict A) := by

done