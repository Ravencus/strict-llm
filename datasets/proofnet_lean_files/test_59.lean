import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators



theorem algebraic_of_square_algebraic {K : Type*} [field K] {F : subfield K} {a : K} 
  (h : is_algebraic F (a^2)) : is_algebraic F a

done