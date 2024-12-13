import Mathlib

open Real
open scoped BigOperators



theorem exercise_3_10 {n : ℕ} (hn0 : ¬ n.Prime) (hn1 : n ≠ 4) :
  Nat.factorial (n-1) ≡ 0 [MOD n] :=by

done