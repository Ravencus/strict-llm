import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem two_diff_positive_numbers : 
  ∃ (a b : ℝ), 0 < a ∧ 0 < b ∧ a ≠ b ∧ (a - 1/a = 1) ∧ (b - 1/b = 1) ∧ a + b = real.sqrt 5 := 
begin
  -- Let a and b be the two different positive numbers
  let a := (1 + real.sqrt 5) / 2,
  let b := (1 - real.sqrt 5) / 2,
  
  -- Show that a and b are positive
  have ha : 0 < a, 
  { rw [a], 
    apply div_pos,
    { linarith [real.sqrt_pos.2 (by norm_num : 0 < 5)] },
    { norm_num } },
  
  have hb : 0 < b, 
  { rw [b], 
    apply div_pos,
    { linarith [real.sqrt_pos.2 (by norm_num : 0 < 5)] },
    { norm_num } },
  
  -- Show that a and b are different
  have hab : a ≠ b, 
  { intro h,
    rw [a, b] at h,
    have : real.sqrt 5 = -real.sqrt 5, 
    { linarith },
    have : real.sqrt 5 = 0, 
    { linarith [real.sqrt_pos.2 (by norm_num : 0 < 5)] },
    linarith [real.sqrt_pos.2 (by norm_num : 0 < 5)] },
  
  -- Show that a and b each differ from their reciprocals by 1
  have ha_recip : a - 1/a = 1, 
  { rw [a],
    field_simp,
    ring_nf,
    rw [real.sqrt_mul_self (by norm_num : 0 ≤ 5)],
    norm_num },
  
  have hb_recip : b - 1/b = 1, 
  { rw [b],
    field_simp,
    ring_nf,
    rw [real.sqrt_mul_self (by norm_num : 0 ≤ 5)],
    norm_num },
  
  -- Show that a + b = sqrt 5
  have hab_sum : a + b = real.sqrt 5, 
  { rw [a, b],
    field_simp,
    ring_nf,
    rw [real.sqrt_mul_self (by norm_num : 0 ≤ 5)],
    norm_num },
  
  -- Conclude the proof
  use [a, b],
  exact ⟨ha, hb, hab, ha_recip, hb_recip, hab_sum⟩,
end

done