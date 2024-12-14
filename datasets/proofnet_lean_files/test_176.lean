import Mathlib

open Real
open scoped BigOperators



theorem sum_of_powers_mod_p (p k : ℕ) (hp : Nat.Prime p) :
  (∑ i in finset.range (p - 1), i^k) ≡ if (p - 1) ∣ k then -1 else 0 [MOD p] := by

done