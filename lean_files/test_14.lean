import Mathlib

open Topology Filter Real Complex TopologicalSpace Finset
open scoped BigOperators



theorem complex_triangle_inequality (z : Fin n → ℂ) : 
  |∑ i, z i| ≤ ∑ i, |z i| := by

done