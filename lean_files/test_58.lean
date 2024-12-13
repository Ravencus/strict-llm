import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators



theorem field_char_p_pow : 
  {F : Type*} [field F] {p n : ℕ} (hp : nat.prime p) (hchar : char_p F p) 
  (a b : F) (n : ℕ) : 
  (a + b)^(p^n) = a^(p^n) + b^(p^n)

done