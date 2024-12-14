import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem sum_of_squares_of_consecutive_integers : 
  ∃ (n : ℤ), (n - 1) * n * (n + 1) = 8 * ((n - 1) + n + (n + 1)) ∧ (n - 1)^2 + n^2 + (n + 1)^2 = 77 :=
begin
  use 3,
  split,
  { -- Prove the product condition
    calc (3 - 1) * 3 * (3 + 1) = 2 * 3 * 4 : by norm_num
    ... = 24 : by norm_num
    ... = 8 * (2 + 3 + 4) : by norm_num },
  { -- Prove the sum of squares condition
    calc (3 - 1)^2 + 3^2 + (3 + 1)^2 = 2^2 + 3^2 + 4^2 : by norm_num
    ... = 4 + 9 + 16 : by norm_num
    ... = 29 : by norm_num }
end

done