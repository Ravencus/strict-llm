import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem solution : ∀ (m n : ℤ), (12 : ℤ)^(m * n) = (2^m)^(2 * n) * (3^n)^m := by

done