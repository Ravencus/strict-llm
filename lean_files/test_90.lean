import Mathlib

open Fintype Complex Polynomial LinearMap FiniteDimensional Module Module.End
open scoped BigOperators



theorem invariant_subspace_even_dimension 
  {K V : Type*} [Field K] [AddCommGroup V] [Module K V]
  (T : End K V) 
  (hT : ∀ v : V, ∃ c : K, v ∈ eigenspace T c ↔ ∃ c : K, v ∈ eigenspace T c) :
  ∀ U : Submodule K V, (U ≤ T.range) → (∃ n : ℕ, finrank K U = 2 * n) := 
by

done