import Mathlib

open Filter Set TopologicalSpace
open scoped Topology



theorem unique_extension_of_uniformly_continuous_function 
  {X Y : Type*} [MetricSpace X] [MetricSpace Y] [CompleteSpace Y] 
  {A : Set X} {f : A → Y} (hf : UniformContinuous f) : 
  ∃! g : Closure A → Y, Continuous g ∧ UniformContinuous g ∧ ∀ x ∈ A, g x = f x := by

done