import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem infinite_minimal_prime_ideals : 
  ∃ (I : ideal (polynomial ℤ)), I.is_prime ∧ ∀ (J : ideal (polynomial ℤ)), J.is_prime → I ≤ J → I = J :=
begin
  -- Proof goes here
end

done