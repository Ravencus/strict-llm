import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem triangle_inequality (a b c : ℝ) (h₀ : a + b > c) (h₁ : b + c > a) (h₂ : c + a > b) :
  a^2 * (b + c - a) + b^2 * (c + a - b) + c^2 * (a + b - c) ≤ 3 * a * b * c := by

done