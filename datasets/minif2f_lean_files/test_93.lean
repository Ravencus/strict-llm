import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem larger_number_is_18 : 
  ∃ (x y : ℝ), x + y = 25 ∧ x - y = 11 ∧ max x y = 18 :=
begin
  use [18, 7],
  split,
  { -- Show that the sum is 25
    linarith, },
  split,
  { -- Show that the difference is 11
    linarith, },
  { -- Show that the larger number is 18
    exact max_eq_left (by linarith), },
end

done