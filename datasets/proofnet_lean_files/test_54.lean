import Mathlib

open Fintype Set Real Ideal Polynomial
open scoped BigOperators



theorem ideal_of_zero_divisors {R : Type*} [comm_ring R] (a : R) : 
  ideal R := 
{ carrier := {x : R | x * a = 0},
  zero_mem' := by simp,
  add_mem' := λ x y hx hy, by simp [hx, hy],
  smul_mem' := λ c x hx, by simp [hx] }

done