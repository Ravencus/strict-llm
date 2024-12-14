import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem solve_system : 
  ∃ x y z : ℤ, 3 * x + y = 17 ∧ 5 * y + z = 14 ∧ 3 * x + 5 * z = 41 ∧ x + y + z = 12 := 
begin
  use [3, 2, 7],
  split,
  { -- Prove 3 * x + y = 17
    norm_num },
  split,
  { -- Prove 5 * y + z = 14
    norm_num },
  split,
  { -- Prove 3 * x + 5 * z = 41
    norm_num },
  { -- Prove x + y + z = 12
    norm_num }
end

done