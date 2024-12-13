import Mathlib

open Function Fintype Subgroup Ideal Polynomial Submodule Zsqrtd
open scoped BigOperators



theorem product_of_nonzero_elements_of_finite_field {p n : ℕ} (hp : Nat.Prime p) :
  ∏ (x : (zmod (p^n))ˣ), x = -1 := by

done