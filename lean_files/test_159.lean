import Mathlib

open Filter Set TopologicalSpace
open scoped Topology



theorem isometry_bijective_homeomorphism {X : Type*} [MetricSpace X] [CompactSpace X] [T2Space X]
  (f : X → X) (h_iso : ∀ x y, dist (f x) (f y) = dist x y) : 
  Function.Bijective f ∧ Continuous f ∧ Continuous (f⁻¹) :=
begin
  -- Proof goes here
end

done