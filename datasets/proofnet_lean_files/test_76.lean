import Mathlib

open Function Fintype Subgroup Ideal Polynomial Submodule Zsqrtd
open scoped BigOperators



theorem ideal_product_intersection {R : Type*} [CommRing R] (I J : Ideal R) (h : I + J = ⊤) : I * J = I ⊓ J

done