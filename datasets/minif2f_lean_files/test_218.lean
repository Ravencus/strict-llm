import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem two_digit_integer_cubed : 
  ∃ (a b : ℕ), a < 10 ∧ b < 10 ∧ (10 * a + b)^3 = 912673 ∧ a + b = 16 := 
begin
  use [9, 1],
  split,
  { exact dec_trivial },
  split,
  { exact dec_trivial },
  split,
  { norm_num },
  { norm_num }
end

done