import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem sequence_nonnegative_real_numbers_prod_le_one 
  (a : ℕ → ℝ) (h₀ : ∀ i, 1 ≤ i ∧ i ≤ n → 0 ≤ a i) (h₁ : Finset.sum (Finset.range n) a = n) :
  Finset.prod (Finset.range n) a ≤ 1 := by

done