import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators



theorem quadratic_residues_and_nonresidues {p : ℕ} (hp : Nat.Prime p) :
  (∃ (s : Finset ℕ), s.card = (p - 1) / 2 ∧ ∀ x ∈ s, ∃ y, y^2 ≡ x [MOD p]) ∧
  (∃ (t : Finset ℕ), t.card = (p - 1) / 2 ∧ ∀ x ∈ t, ¬ ∃ y, y^2 ≡ x [MOD p]) := by

done