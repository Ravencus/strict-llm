import Mathlib

open Function Fintype Subgroup Ideal Polynomial Submodule Zsqrtd
open scoped BigOperators

open RingHom


theorem field_hom_injective {F G : Type*} [field F] [field G] (f : F →+* G) : function.injective f :=
begin
  intros a b h,
  have : f (a - b) = 0 := by rw [ring_hom.map_sub, h, sub_self],
  rw [← sub_eq_zero, ← ring_hom.map_zero f] at this,
  exact eq_of_sub_eq_zero (ring_hom.map_eq_zero_iff f).mp this,
end

done