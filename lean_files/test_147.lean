import Mathlib

open Filter Set TopologicalSpace
open scoped Topology



theorem unique_extension {A : Set X} {Y : Type*} [MetricSpace Y] {f : A → Y} (hf : Continuous f) :
  ∀ g g' : closure A → Y, Continuous g → Continuous g' → (∀ x ∈ A, g x = f x) → (∀ x ∈ A, g' x = f x) → g = g' := by

done