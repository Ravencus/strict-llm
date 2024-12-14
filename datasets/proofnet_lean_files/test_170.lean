import Mathlib

open Real
open scoped BigOperators



theorem gcd_of_powers_of_a (a : ℤ) (n m : ℕ) (hnm : n > m) (ha : a ≠ 0) : 
  gcd (a^(2^n) + 1) (a^(2^m) + 1) = if even a then 2 else 1

done