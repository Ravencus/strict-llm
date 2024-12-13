import Mathlib

open Filter Set TopologicalSpace
open scoped Topology



theorem exercise_18_13
  {X : Type*} [TopologicalSpace X] {Y : Type*} [TopologicalSpace Y]
  [T2Space Y] {A : Set X} {f : A → Y} (hf : Continuous f)
  (g : closure A → Y)
  (g_con : Continuous g) :
  ∀ (g' : closure A → Y), Continuous g' →  (∀ (x : closure A), g x = g' x) :=by

done