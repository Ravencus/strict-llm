import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem find_abc : 
  let n := 3^17 + 3^10 in 
  11 ∣ n + 1 ∧ 
  (∃ (A B C : ℕ), 
    A ≠ B ∧ B ≠ C ∧ A ≠ C ∧ 
    A % 2 = 1 ∧ C % 2 = 1 ∧ 
    B % 3 ≠ 0 ∧ 
    n = A * 10^8 + B * 10^7 + C * 10^6 + A * 10^5 + C * 10^4 + C * 10^3 + B * 10^2 + A * 10 + B ∧ 
    100 * A + 10 * B + C = 129) := 
by

done