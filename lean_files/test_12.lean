import Mathlib

open Fintype Complex Polynomial LinearMap FiniteDimensional Module Module.End
open scoped BigOperators



theorem lower_bound_le_upper_bound {α : Type*} [linear_order α] {E : set α} (hE : E.nonempty) 
  (hα : ∀ x ∈ E, α ≤ x) (hβ : ∀ x ∈ E, x ≤ β) : α ≤ β :=
begin
  obtain ⟨x, hx⟩ := hE,
  exact le_trans (hα x hx) (hβ x hx),
end

done