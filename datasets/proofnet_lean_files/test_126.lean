import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem unit_neg_unit {R : Type*} [ring R] {u : R} (hu : is_unit u) : is_unit (-u) :=
begin
  obtain ⟨v, huv⟩ := hu,
  use -v,
  rw [neg_mul_neg, huv],
end

done