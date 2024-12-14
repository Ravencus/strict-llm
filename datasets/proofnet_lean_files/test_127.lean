import Mathlib

open Fintype Subgroup Set Polynomial Ideal
open scoped BigOperators



theorem subring_of_field_is_integral_domain {R : Type*} [Field R] (S : Subring R) (h : (1 : R) ∈ S) : IsDomain S

done