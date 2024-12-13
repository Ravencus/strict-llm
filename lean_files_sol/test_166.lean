import Mathlib

open Filter Set TopologicalSpace
open scoped Topology

abbrev I : Set ℝ := Icc 0 1



theorem exercise_33_7 {X : Type*} [TopologicalSpace X]
  (hX : LocallyCompactSpace X) (hX' : T2Space X) :
  ∀ x A, IsClosed A ∧ ¬ x ∈ A →
  ∃ (f : X → I), Continuous f ∧ f x = 1 ∧ f '' A = {0} :=by

done