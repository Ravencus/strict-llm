import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem integral_domain_to_pid {R : Type*} [Ring R] [IsDomain R] 
  (h1 : ∀ (a b : R), ∃ (g r s : R), g = r * a + s * b ∧ ∀ (d : R), d ∣ a → d ∣ b → d ∣ g)
  (h2 : ∀ (a : ℕ → R), (∀ i, a (i + 1) ∣ a i) → ∃ N, ∀ n ≥ N, IsUnit (a n / a N)) :
  IsPrincipalIdealRing R

done