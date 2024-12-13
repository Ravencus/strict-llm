import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem maximal_subgroup_exists {G : Type*} [group G] [fintype G] {H : subgroup G} (hH : H < ⊤) :
  ∃ M : subgroup G, M ≠ ⊤ ∧ H ≤ M ∧ ∀ K : subgroup G, M ≤ K → K = M ∨ K = ⊤ :=
begin
  -- Proof goes here
end

done