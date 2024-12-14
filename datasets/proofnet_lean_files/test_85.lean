import Mathlib

open Fintype Complex Polynomial LinearMap FiniteDimensional Module Module.End
open scoped BigOperators



theorem union_of_subspaces_is_subspace_iff_one_is_contained_in_other 
  {F : Type*} [field F] {V : Type*} [add_comm_group V] [module F V] 
  (U₁ U₂ : submodule F V) : 
  submodule F V :=
begin
  split,
  { intro h,
    by_cases h₁ : U₁ ≤ U₂,
    { left, exact h₁ },
    { right, 
      have h₂ : U₂ ≤ U₁,
      { intros x hx,
        by_contradiction hcontra,
        have : x ∈ (U₁ ⊔ U₂) := submodule.mem_sup_right hx,
        rw h at this,
        exact hcontra this },
      exact h₂ } },
  { rintro (h₁ | h₂),
    { rw submodule.sup_eq_right.mpr h₁ },
    { rw submodule.sup_eq_left.mpr h₂ } }
end

done