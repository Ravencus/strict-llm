import Mathlib

open Topology Filter Real Complex TopologicalSpace Finset
open scoped BigOperators



theorem separation_of_compact_closed_sets 
  {X : Type*} [MetricSpace X] [CompleteSpace X] 
  {K F : Set X} (hK : IsCompact K) (hF : IsClosed F) (h_disjoint : Disjoint K F) :
  ∃ δ > 0, ∀ p ∈ K, ∀ q ∈ F, dist p q > δ

done