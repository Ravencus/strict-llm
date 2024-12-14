import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem calculate_f_14_52 : 
  ∃ (f : ℕ × ℕ → ℕ), 
    (∀ x, f (x, x) = x) ∧ 
    (∀ x y, f (x, y) = f (y, x)) ∧ 
    (∀ x y, (x + y) * f (x, y) = y * f (x, x + y)) ∧ 
    f (14, 52) = 364 := 
begin
  let f : ℕ × ℕ → ℕ := λ p, p.1 * p.2 / gcd p.1 p.2,
  use f,
  split,
  { intro x,
    rw [gcd_self, nat.div_self (nat.pos_of_ne_zero (ne_of_gt (nat.succ_pos x)))],
    refl },
  split,
  { intros x y,
    rw [prod.mk.eta, prod.mk.eta, gcd_comm, mul_comm] },
  split,
  { intros x y,
    have h := gcd_add_mul_div x y,
    rw [mul_comm, mul_assoc, ←mul_div_assoc, ←mul_div_assoc, mul_comm y, mul_comm (x + y)] at h,
    exact h },
  { refl }
end

done