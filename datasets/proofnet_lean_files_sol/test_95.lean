import Mathlib

open Fintype Complex Polynomial LinearMap FiniteDimensional Module Module.End
open scoped BigOperators



theorem exercise_7_11 {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℂ V]
  [FiniteDimensional ℂ V] {T : End ℂ V} (hT : T*adjoint T = adjoint T*T) :
  ∃ (S : End ℂ V), S ^ 2 = T :=by

done