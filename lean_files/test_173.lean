import Mathlib

open Real
open scoped BigOperators



theorem not_prime_factorial_congruence (n : ℕ) (hn : ¬ Nat.Prime n) (h4 : n ≠ 4) : (n - 1)! ≡ 0 [MOD n] := by

done