import Mathlib

open Filter Set TopologicalSpace
open scoped Topology

abbrev I : Set ℝ := Icc 0 1



theorem locally_compact_Hausdorff_completely_regular {X : Type*} [TopologicalSpace X] (hX : LocallyCompactSpace X) (hX' : T2Space X) : RegularSpace X := by

done