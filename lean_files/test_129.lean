import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem image_center_in_center {R S : CommRing} (φ : R →+* S) (hφ : function.surjective φ) :
  φ '' (set.center R) ⊆ set.center S :=
begin
  intros z hz,
  rcases hz with ⟨x, hx, rfl⟩,
  intros s,
  obtain ⟨r, hr⟩ := hφ s,
  rw [← hr, ← φ.map_mul, ← φ.map_mul, hx],
end

done