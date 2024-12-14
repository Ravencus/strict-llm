import Mathlib

open Filter Set TopologicalSpace
open scoped Topology

abbrev I : Set ℝ := Icc 0 1



theorem exercise_29_4 [TopologicalSpace (ℕ → I)] :
  ¬ LocallyCompactSpace (ℕ → I) :=by

done