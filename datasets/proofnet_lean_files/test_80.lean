import Mathlib

open Function Fintype Subgroup Ideal Polynomial Submodule Zsqrtd
open scoped BigOperators



theorem infinite_primes_congruent_neg_one_mod_four : Infinite {p : Nat.Primes // p ≡ -1 [ZMOD 4]} := by

done