import Mathlib

open Filter Set TopologicalSpace
open scoped Topology



theorem closed_set_of_le {X Y : Type*} [TopologicalSpace X] [LinearOrder Y] [OrderTopology Y]
  {f g : X → Y} (hf : Continuous f) (hg : Continuous g) :
  IsClosed {x | f x ≤ g x}

done