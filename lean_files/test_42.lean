import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators



theorem group_no_proper_subgroups_cyclic_of_prime_order 
  {G : Type*} [Group G] [Fintype G] (H : Subgroup G) [Fintype H] :
  IsSimpleGroup G → false := by

done