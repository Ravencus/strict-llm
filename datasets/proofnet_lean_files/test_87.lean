import Mathlib

open Fintype Complex Polynomial LinearMap FiniteDimensional Module Module.End
open scoped BigOperators



theorem invariant_sum_of_invariant_subspaces {F V : Type*} [Field F] [AddCommGroup V] [Module F V]
  {T : End F V} {m : ℕ} {U : Fin m → Submodule F V}
  (hU : ∀ i, Submodule.map T (U i) ≤ U i) :
  Submodule.map T (⨆ i, U i) ≤ ⨆ i, U i :=
begin
  intros x hx,
  rw Submodule.mem_supr at *,
  obtain ⟨i, hi⟩ := hx,
  use i,
  exact hU i hi,
end

done