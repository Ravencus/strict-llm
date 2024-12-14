import Mathlib

open Fintype Complex Polynomial LinearMap FiniteDimensional Module Module.End
open scoped BigOperators



theorem exercise_7_5 {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℂ V]
  [FiniteDimensional ℂ V] (hV : finrank V ≥ 2) :
  ∀ U : Submodule ℂ (End ℂ V), U.carrier ≠
  {T | T * adjoint T = adjoint T * T} :=by

done