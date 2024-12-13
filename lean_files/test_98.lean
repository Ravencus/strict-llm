import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem inverse_product : ∀ (G : Type) [group G] (a : ℕ → G) (n : ℕ), (∏ i in finset.range n, a i)⁻¹ = ∏ i in finset.range n, (a (n - 1 - i))⁻¹ := by

done