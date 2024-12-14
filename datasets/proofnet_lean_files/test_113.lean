import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem quotient_group_of_solvable_is_solvable {G : Type*} [Group G] (H : Subgroup G) [IsSolvable G] : IsSolvable (G ⧸ H) := by

done