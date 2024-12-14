import Mathlib

open Filter Set TopologicalSpace
open scoped Topology

abbrev I : Set ℝ := Icc 0 1



theorem not_locally_compact_uniform_topology : ¬LocallyCompactSpace (Set.Icc (0 : ℝ) 1) := by

done