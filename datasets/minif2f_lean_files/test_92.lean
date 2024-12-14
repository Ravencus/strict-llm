import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem mersenne_prime_implication (n : ℕ) (h₀ : 0 < n) (h₁ : Nat.Prime (2^n - 1)) : Nat.Prime n := by

done