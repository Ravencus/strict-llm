import Mathlib

open Topology Filter Real Complex TopologicalSpace Finset
open scoped BigOperators



theorem continuous_extension {α : Type} [MetricSpace α] {β : Type} [MetricSpace β] 
  (f g : α → β) (h₁ : Continuous f) (h₂ : Continuous g) (s : Set α) (h₃ : Dense s) 
  (h₄ : ∀ p ∈ s, g p = f p) : ∀ p, g p = f p

done