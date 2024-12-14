import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem product_of_odd_integers : 
  (S : Finset ℕ) (h₀ : ∀ x : ℕ, x ∈ S ↔ 0 < x ∧ x < 10000 ∧ x % 2 = 1) → 
  ∏ x in S, x = 10000! / (2^5000 * 5000!) := by

done