import Mathlib

open Real
open scoped BigOperators



theorem harmonic_not_integer (n : ℕ) (hn : 1 < n) : ¬ ∃ k : ℤ, ∑ i in finset.range n, (1 : ℚ) / (i + 1) = k := by

done