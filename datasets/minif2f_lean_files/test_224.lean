import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem point_distance_problem : 
  ∃ (x y : ℝ), y = -6 ∧ (x - 8) ^ 2 + (y - 3) ^ 2 = 15 ^ 2 ∧ x ^ 2 + y ^ 2 = 52 :=
begin
  use [-12, -6],
  split,
  { refl },
  split,
  { norm_num },
  { norm_num }
end

done