import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem prime_numbers_between_4_and_18 : 
  ∃ (x y : ℕ), prime x ∧ prime y ∧ 4 < x ∧ x < 18 ∧ 4 < y ∧ y < 18 ∧ x ≠ y ∧ (x * y - (x + y) = 119) := by
  -- List the prime numbers between 4 and 18
  let primes := [5, 7, 11, 13, 17]
  -- Check pairs of these primes
  have h : ∃ (x y : ℕ), x ∈ primes ∧ y ∈ primes ∧ x ≠ y ∧ (x * y - (x + y) = 119),
  { use [7, 17],
    split,
    { simp },
    split,
    { simp },
    split,
    { norm_num },
    calc
      7 * 17 - (7 + 17) = 119 : by norm_num },
  exact h

done