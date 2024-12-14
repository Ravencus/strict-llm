import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem odd_integer_and_multiple_of_four (a b : ℤ) (h₀ : a % 2 = 1) (h₁ : 4 ∣ b) : a^2 + b^2 ≡ 1 [MOD 8] := by

done