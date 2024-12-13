import Mathlib

open Filter Set TopologicalSpace
open scoped Topology



theorem prod_Hausdorff_implies_each_Hausdorff {X : ι → Type*} [∀ i, TopologicalSpace (X i)] 
  (h : ∀ i, Nonempty (X i)) (h2 : RegularSpace (Π i, X i)) : ∀ i, RegularSpace (X i) := by

done