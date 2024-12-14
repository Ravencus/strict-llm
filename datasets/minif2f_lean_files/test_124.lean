import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem smallest_k : ∃ k, (∀ n : ℕ, 0 < n → Nat.coprime (6 * n + k) (6 * n + 3) ∧ Nat.coprime (6 * n + k) (6 * n + 2) ∧ Nat.coprime (6 * n + k) (6 * n + 1)) ∧ k = 5 :=
begin
  use 5,
  intros n hn,
  split,
  { apply Nat.coprime_of_dvd,
    { intro d,
      rw [Nat.dvd_add_iff_right (Nat.dvd_mul_left 6 n)],
      intro h,
      cases h with h1 h2,
      { exact Nat.not_dvd_one 3 h1 },
      { exact Nat.not_dvd_one 2 h2 } },
    { exact Nat.coprime_one_right _ } },
  split,
  { apply Nat.coprime_of_dvd,
    { intro d,
      rw [Nat.dvd_add_iff_right (Nat.dvd_mul_left 6 n)],
      intro h,
      cases h with h1 h2,
      { exact Nat.not_dvd_one 2 h1 },
      { exact Nat.not_dvd_one 1 h2 } },
    { exact Nat.coprime_one_right _ } },
  { apply Nat.coprime_of_dvd,
    { intro d,
      rw [Nat.dvd_add_iff_right (Nat.dvd_mul_left 6 n)],
      intro h,
      cases h with h1 h2,
      { exact Nat.not_dvd_one 1 h1 },
      { exact Nat.not_dvd_one 0 h2 } },
    { exact Nat.coprime_one_right _ } }
end

done