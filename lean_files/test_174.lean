import Mathlib

open Real
open scoped BigOperators



theorem primitive_root_neg_iff {p t : ℕ} (hp0 : p.Prime) (hp1 : p = 4*t + 1) (a : ℤ) :
  IsPrimitiveRoot a p ↔ IsPrimitiveRoot (-a) p := by

done