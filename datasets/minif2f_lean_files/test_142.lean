import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem arithmetic_progression_sum : 
  ∀ (a : ℕ → ℕ) (h₀ : a 1 ≠ a 2) (h₁ : a 1 ≠ a 3) (h₂ : a 1 ≠ a 4) (h₃ : a 2 ≠ a 3) (h₄ : a 2 ≠ a 4) (h₅ : a 3 ≠ a 4)
  (v : ℕ → ℕ) (h₆ : ∀ n, v n = 2 * n - 1),
  (a 2 + a 4 + a 6 + a 8 + ... + a 98 = 93) := by

done