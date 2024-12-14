import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem smallest_N_not_prime : 
  ∃ N : ℕ, N > 0 ∧ ¬ Nat.prime (7 + 30 * N) ∧ ∀ M : ℕ, M > 0 ∧ M < N → Nat.prime (7 + 30 * M) := 
begin
  use 6,
  split,
  { exact nat.succ_pos 5, },
  split,
  { norm_num, },
  { intros M hM,
    have h : 7 + 30 * M < 7 + 30 * 6,
    { linarith, },
    norm_num at h,
    cases M,
    { exfalso, linarith, },
    cases M,
    { norm_num, },
    cases M,
    { norm_num, },
    cases M,
    { norm_num, },
    cases M,
    { norm_num, },
    cases M,
    { norm_num, },
    exfalso,
    linarith, },
end

done