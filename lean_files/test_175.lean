import Mathlib

open Real
open scoped BigOperators



theorem fermat_prime_primitive_root {p : ℕ} (hp : p.Prime ∧ p > 2) : IsPrimitiveRoot 3 p := by

done