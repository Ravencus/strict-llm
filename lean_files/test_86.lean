import Mathlib

open Fintype Complex Polynomial LinearMap FiniteDimensional Module Module.End
open scoped BigOperators



theorem exists_subspace_U {V W : Type*} [NormedAddCommGroup V] [InnerProductSpace ℂ V] [FiniteDimensional ℂ V]
  [NormedAddCommGroup W] [InnerProductSpace ℂ W] (T : V →ₗ[ℂ] W) :
  ∃ (U : Submodule ℂ V), U ⊓ T.ker = ⊥ ∧ T.range = U.map T

done