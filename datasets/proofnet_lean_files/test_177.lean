import Mathlib

open Real
open scoped BigOperators



theorem solution_exists_iff_form :
  ∀ {p : ℕ}, (∃ x : ℕ, x^4 ≡ 2 [ZMOD p]) ↔ (∃ A B : ℕ, p = A^2 + 64*B^2) :=
begin
  sorry
end

done