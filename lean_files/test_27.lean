import Mathlib

open Topology Filter Real Complex TopologicalSpace Finset
open scoped BigOperators



theorem zero_set_closed {α : Type} [MetricSpace α] (f : α → ℝ) (hf : Continuous f) :
  IsClosed {p : α | f p = 0} := by

done