import Mathlib

open Fintype Complex Polynomial LinearMap FiniteDimensional Module Module.End
open scoped BigOperators



theorem normal_operator_has_square_root 
  {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℂ V] 
  (T : End ℂ V) (hT : T * adjoint T = adjoint T * T) : 
  ∃ S : End ℂ V, S * S = T := by

done