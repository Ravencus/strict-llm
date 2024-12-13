import Mathlib

open Topology Filter Real Complex TopologicalSpace Finset
open scoped BigOperators



theorem no_nonzero_orthogonal_vector (x : EuclideanSpace ℝ (Fin 1)) : ¬ ∃ (y : EuclideanSpace ℝ (Fin 1)), y ≠ 0 ∧ (inner x y) = (0 : ℝ) := by

done