import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem four_digit_even_divisible_by_five : 
  ∃ n : ℕ, n = 100 ∧ ∀ x : ℕ, (1000 ≤ x ∧ x ≤ 9999 ∧ (∀ d ∈ [x / 1000, (x / 100) % 10, (x / 10) % 10, x % 10], d % 2 = 0) ∧ x % 5 = 0) → x ∈ finset.range n :=
begin
  -- We need to count the number of 4-digit numbers with even digits that are divisible by 5.
  let even_digits := [0, 2, 4, 6, 8],
  let last_digit := [0, 5], -- last digit must be 0 or 5 for divisibility by 5
  let count := (even_digits.length - 1) * even_digits.length * even_digits.length * last_digit.length,
  -- The first digit cannot be 0, hence (even_digits.length - 1)
  -- The last digit must be 0 or 5, hence last_digit.length
  use count,
  split,
  { -- Show that the count is 100
    simp [even_digits.length, last_digit.length],
    norm_num,
  },
  { -- Show that for any x satisfying the conditions, x is in the range of count
    intros x hx,
    rcases hx with ⟨hx1, hx2, hx3, hx4⟩,
    -- Check that x is a 4-digit number with even digits and divisible by 5
    have h_digits : ∀ d ∈ [x / 1000, (x / 100) % 10, (x / 10) % 10, x % 10], d ∈ even_digits,
    { intros d hd,
      specialize hx3 d hd,
      simp [even_digits] at hx3,
      exact hx3,
    },
    -- Check divisibility by 5
    have h_div5 : x % 5 = 0,
    { exact hx4, },
    -- Conclude that x is in the range of count
    sorry, -- Further steps to show x is in the range
  }
end

done