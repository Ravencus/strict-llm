import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators



theorem commutes_with_a {R : Type*} [ring R] {a x : R} (h : a^2 = 0) : a * (a * x + x * a) = (a * x + x * a) * a :=
begin
  -- Proof goes here
end

done