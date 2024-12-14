import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem series_inequality (a : ℕ → ℝ) (h₀ : a 0 = 1) (h₁ : ∑ n in finset.range 100, a (n + 1) ^ 2 = 1) :
  ∑ n in finset.range 99, (a (n + 1) ^ 2 * a (n + 2)) + a 100 ^ 2 * a 1 < 12 / 25 := by

done