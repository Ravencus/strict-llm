import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem smallest_lcm_of_a_b : 
  ∃ (a b : ℕ), 0 < a ∧ 0 < b ∧ a % 10 = 2 ∧ b % 10 = 4 ∧ gcd a b = 6 ∧ lcm a b = 108 := 
begin
  use [12, 18],
  split,
  { exact nat.zero_lt_succ 11 },
  split,
  { exact nat.zero_lt_succ 17 },
  split,
  { exact nat.mod_eq_of_lt (by norm_num) },
  split,
  { exact nat.mod_eq_of_lt (by norm_num) },
  split,
  { exact nat.gcd_eq_right (by norm_num) },
  { exact nat.lcm_eq_of_gcd_eq (by norm_num) }
end

done