import Mathlib

open Fintype Complex Polynomial LinearMap FiniteDimensional Module Module.End
open scoped BigOperators



theorem orthonormal_projection {K V : Type*} [Field K] [AddCommGroup V] [Module K V] 
  (e : Fin m → V) (h_orthonormal : Orthonormal K e) {v : V} :
  ‖v‖^2 = ∑ i, ‖⟪v, e i⟫‖^2 ↔ v ∈ Submodule.span K (Set.range e) := by

done