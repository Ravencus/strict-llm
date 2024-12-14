import Mathlib

open Topology Filter Real Complex TopologicalSpace Finset
open scoped BigOperators



theorem limit_sqrt_n_sq_plus_n_sub_n : tendsto (λ n, (real.sqrt (n^2 + n) - n)) at_top (𝓝 (1/2)) := by

done