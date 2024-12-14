import Mathlib

open Fintype Complex Polynomial LinearMap FiniteDimensional Module Module.End
open scoped BigOperators



theorem normal_operators_not_subspace (K V : Type*) [RCLike K] [NormedAddCommGroup V] [InnerProductSpace K V] 
  (hV : finrank K V ≥ 2) : 
  ¬(∀ (T : End ℂ V), T * adjoint T = adjoint T * T → ∃ (a b : ℂ), T = a • 1 + b • T) := by

done