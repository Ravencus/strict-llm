import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem perfect_square_for_large_n : ∀ (n : ℕ), n ≥ 9 → ∃ k : ℕ, (n + 2)! - (n + 1)! = k^2 * n! :=
begin
  intros n hn,
  use (n + 1),
  rw [factorial_succ, factorial_succ, mul_sub, sub_mul, sub_self, zero_mul, add_zero],
  exact ⟨rfl⟩,
end

done