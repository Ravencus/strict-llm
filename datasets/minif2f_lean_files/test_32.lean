import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem distinct_digits_sum : 
  ∃ (a b c : ℕ), 
  a ≠ b ∧ b ≠ c ∧ a ≠ c ∧ 
  1 ≤ a ∧ a ≤ 9 ∧ 
  1 ≤ b ∧ b ≤ 9 ∧ 
  1 ≤ c ∧ c ≤ 9 ∧ 
  a + b = c ∧ 
  (10 * a + a) - b = 2 * c ∧ 
  c * b = (10 * a + a) + a ∧ 
  a + b + c = 8 := 
begin
  -- Proof goes here
end

done