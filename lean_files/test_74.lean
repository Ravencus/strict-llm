import Mathlib

open Function Fintype Subgroup Ideal Polynomial Submodule Zsqrtd
open scoped BigOperators



theorem nilpotent_plus_one_is_unit {R : Type*} [ring R] {x : R} (hx : is_nilpotent x) : is_unit (1 + x) :=
begin
  obtain ⟨n, hn⟩ := hx,
  use (1 - x + x^2 - x^3 + ... + (-1)^(n-1) * x^(n-1)),
  split,
  { calc
      (1 + x) * (1 - x + x^2 - x^3 + ... + (-1)^(n-1) * x^(n-1))
          = 1 - x^n : by ring
      ... = 1 : by rw hn },
  { calc
      (1 - x + x^2 - x^3 + ... + (-1)^(n-1) * x^(n-1)) * (1 + x)
          = 1 - x^n : by ring
      ... = 1 : by rw hn }
end

done