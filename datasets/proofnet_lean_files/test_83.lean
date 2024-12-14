import Mathlib

open Fintype Complex Polynomial LinearMap FiniteDimensional Module Module.End
open scoped BigOperators



theorem zero_or_zero_of_smul_eq_zero {𝕜 : Type*} [field 𝕜] {V : Type*} [add_comm_group V] [module 𝕜 V] 
  {a : 𝕜} {v : V} (h : a • v = 0) : a = 0 ∨ v = 0 :=
begin
  by_cases ha : a = 0,
  { left, exact ha },
  { right, apply smul_eq_zero.mp h, exact ha }
end

done