import Mathlib

open Topology Filter Real Complex TopologicalSpace Finset
open scoped BigOperators



theorem exercise_3_2a
  : Tendsto (λ (n : ℝ) => (sqrt (n^2 + n) - n)) atTop (𝓝 (1/2)) :=by

done