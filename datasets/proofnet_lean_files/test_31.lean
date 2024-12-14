import Mathlib

open Topology Filter Real Complex TopologicalSpace Finset
open scoped BigOperators



theorem uniformly_continuous_image_of_cauchy_is_cauchy 
  {α : Type*} [MetricSpace α] {β : Type*} [MetricSpace β] 
  (f : α → β) (hf : UniformContinuous f) 
  (p : ℕ → α) (hp : CauchySeq p) : CauchySeq (f ∘ p) :=
begin
  -- Proof goes here
end

done