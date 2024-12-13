import Mathlib

open Filter Set TopologicalSpace
open scoped Topology

abbrev I : Set ℝ := Icc 0 1



theorem exercise_21_6b
  (f : ℕ → I → ℝ )
  (h : ∀ x n, f n x = x ^ n) :
  ¬ ∃ f₀, TendstoUniformly f f₀ atTop :=by

done