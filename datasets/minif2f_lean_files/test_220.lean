import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem find_other_number : 
  ∃ b, Nat.lcm 120 b = 3720 ∧ Nat.gcd 120 b = 8 ∧ b = 248 := by
  use 248
  split
  { -- Prove that the least common multiple of 120 and 248 is 3720
    rw Nat.lcm_eq,
    have h₀ : Nat.gcd 120 248 = 8 := by
      -- Calculate gcd(120, 248)
      calc
        Nat.gcd 120 248 = Nat.gcd 120 (248 % 120) : by rw Nat.gcd_rec
        ... = Nat.gcd 120 8 : by norm_num
        ... = 8 : by norm_num,
    rw h₀,
    calc
      120 * 248 / 8 = 3720 : by norm_num },
  { -- Prove that the greatest common divisor of 120 and 248 is 8
    rw Nat.gcd_comm,
    exact h₀ }

done