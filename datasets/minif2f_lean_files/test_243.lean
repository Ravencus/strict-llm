import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem line_equation_m_plus_b : 
  ∃ (m b : ℝ), (∀ x, (m * x + b) = (7 - (-1)) / (7 - (-1)) * x + (7 - (7 - (-1)) / (7 - (-1)) * 7)) ∧ m + b = 5 :=
begin
  let m := (7 - (-1)) / (7 - (-1)),
  let b := 7 - m * 7,
  use [m, b],
  split,
  { intro x,
    rw [←mul_add, ←add_assoc, ←sub_eq_add_neg, ←sub_eq_add_neg],
    simp },
  { calc
      m + b = (7 - (-1)) / (7 - (-1)) + (7 - (7 - (-1)) / (7 - (-1)) * 7) : by refl
      ... = 5 : by norm_num }
end

done