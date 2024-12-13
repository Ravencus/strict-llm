import Mathlib

open Topology Filter Real Complex TopologicalSpace Finset
open scoped BigOperators



theorem complex_number_identity (z : ℂ) (hz : abs z = 1) : abs (1 + z) ^ 2 + abs (1 - z) ^ 2 = 4 := by

done