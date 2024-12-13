import Mathlib

open Topology Filter Real Complex TopologicalSpace Finset
open scoped BigOperators



theorem parallelogram_law (x y : EuclideanSpace ℝ (Fin k)) : 
  ∥x + y∥^2 + ∥x - y∥^2 = 2 * ∥x∥^2 + 2 * ∥y∥^2 := by

done