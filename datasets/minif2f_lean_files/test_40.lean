import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem mr_wrench_charge : 
  ∃ N x, (N + x = 97) ∧ (N + 5 * x = 265) ∧ (N + 2 * x = 139) := 
begin
  use [32, 65],
  split,
  { -- N + x = 97
    refl },
  split,
  { -- N + 5 * x = 265
    refl },
  { -- N + 2 * x = 139
    refl }
end

done