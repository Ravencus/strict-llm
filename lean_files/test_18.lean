import Mathlib

open Topology Filter Real Complex TopologicalSpace Finset
open scoped BigOperators



theorem disjoint_closed_sets_separated {X : Type*} [MetricSpace X] 
  (A B : Set X) (hA : IsClosed A) (hB : IsClosed B) (hAB : Disjoint A B) : 
  SeparableSpace X := by

done