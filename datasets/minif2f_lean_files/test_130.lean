import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem find_inverse_mod : ∃ b : ℤ, 0 ≤ b ∧ b < 11^2 ∧ 24 * b ≡ 1 [MOD 11^2] := by
  use 116
  split
  { norm_num }
  split
  { norm_num }
  { norm_num }
  { rw [← nat.modeq_iff_dvd, int.coe_nat_mul, int.coe_nat_one],
    norm_num }

done