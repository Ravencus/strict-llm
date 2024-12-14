import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem factorial_less_than_power : ∀ (n : ℕ), n ≥ 3 → n! < n^(n-1) := by

done