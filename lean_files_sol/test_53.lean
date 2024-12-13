import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators



theorem exercise_4_2_6 {R : Type*} [Ring R] (a x : R)
  (h : a ^ 2 = 0) : a * (a * x + x * a) = (x + x * a) * a :=by

done