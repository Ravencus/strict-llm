import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem arithmetic_sequence_21st_term : 
  ∃ (a d : ℝ), (∀ n : ℕ, u n = a + n * d) ∧ u 6 = 30 ∧ u 10 = 60 ∧ u 20 = 135 :=
begin
  use [30, 7.5], -- a = 30, d = 7.5
  split,
  { intro n,
    exact a + n * d },
  split,
  { rw [u 6, a + 6 * d],
    norm_num },
  split,
  { rw [u 10, a + 10 * d],
    norm_num },
  { rw [u 20, a + 20 * d],
    norm_num }
end

done