import Mathlib

open Filter Set TopologicalSpace
open scoped Topology



theorem component_normal_subgroup {G : Type*} [topological_space G] [group G] [topological_group G] 
  (C : set G) (hC : is_connected C) (he : (1 : G) ∈ C) : 
  is_normal_subgroup C

done