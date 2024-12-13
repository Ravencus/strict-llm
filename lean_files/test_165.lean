import Mathlib

open Filter Set TopologicalSpace
open scoped Topology



theorem normality_of_product_implies_normality_of_factors {X : Type*} [∀ i, TopologicalSpace (X i)] 
  (h2 : RegularSpace (Π i, X i)) (h : ∀ i, Nonempty (X i)) : ∀ i, RegularSpace (X i) := by

done