import Mathlib

open Fintype Complex Polynomial LinearMap FiniteDimensional Module Module.End
open scoped BigOperators



theorem same_eigenvalues_of_commute {F : Type*} [field F] {V : Type*} [add_comm_group V] [module F V]
  (S T : V →ₗ[F] V) : S * T = T * S → ∀ λ, (∃ v, v ≠ 0 ∧ S T v = λ • v) ↔ (∃ v, v ≠ 0 ∧ T S v = λ • v)

done