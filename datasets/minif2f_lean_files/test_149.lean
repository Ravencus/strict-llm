import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem perfect_square_divisors_of_factorial_product : 
  ∃ n : ℕ, n = 672 ∧ 
  (∀ m : ℕ, m * m ∣ ∏ i in finset.range 10, i.factorial → m * m ∣ n) := 
begin
  -- Proof goes here
end

done