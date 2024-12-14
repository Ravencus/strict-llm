import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem arithmetic_sequence_nth_term : 
  ∀ (x n : ℝ), (a : ℕ → ℝ) (h₀ : ∀ n, a (n + 2) - a (n + 1) = a (n + 1) - a n) 
  (h₁ : a 1 = 2 * x - 3) (h₂ : a 2 = 5 * x - 11) (h₃ : a 3 = 3 * x + 1) 
  (h₄ : a n = 2009), n = 502 := 
by

done