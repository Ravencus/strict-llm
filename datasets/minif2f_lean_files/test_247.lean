import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem remainder_twice_number_divided_by_5 : 
  ∀ n, n % 5 = 3 → (2 * n) % 5 = 1 := 
begin
  intros n h,
  have h1 : n = 5 * (n / 5) + 3 := by rw [nat.mod_add_div n 5, h],
  rw [h1, mul_add, mul_comm 5, mul_assoc, add_mul, add_assoc, add_comm (2 * 3)],
  simp,
end

done