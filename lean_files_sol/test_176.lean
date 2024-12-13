import Mathlib

open Real
open scoped BigOperators



theorem exercise_4_11 {p : ℕ} (hp : p.Prime) (k s: ℕ)
  (s := ∑ n : Fin p, (n : ℕ) ^ k) :
  ((¬ p - 1 ∣ k) → s ≡ 0 [MOD p]) ∧ (p - 1 ∣ k → s ≡ 0 [MOD p]) :=by

done