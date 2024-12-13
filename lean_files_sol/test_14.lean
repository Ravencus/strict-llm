import Mathlib

open Topology Filter Real Complex TopologicalSpace Finset
open scoped BigOperators



theorem exercise_1_12 (n : ℕ) (f : ℕ → ℂ) :
  abs (∑ i in range n, f i) ≤ ∑ i in range n, abs (f i) :=by

done