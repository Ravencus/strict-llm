import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators



theorem distinct_roots_of_x_pow_m_minus_x {F : Type*} [field F] {p n : ℕ} (hp : Nat.Prime p) (hchar : char_p F p) :
  ∀ x : F, x ^ (p ^ n) = x → x = 0

done