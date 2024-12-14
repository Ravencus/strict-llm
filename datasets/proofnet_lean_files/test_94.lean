import Mathlib

open Fintype Complex Polynomial LinearMap FiniteDimensional Module Module.End
open scoped BigOperators



theorem normal_operator_self_adjoint_iff_real_eigenvalues 
  {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℂ V] 
  (T : Module.End ℂ V) (hT : IsNormal T) : 
  IsSelfAdjoint T ↔ ∀ λ ∈ T.eigenvalues, λ.im = 0 := by

done