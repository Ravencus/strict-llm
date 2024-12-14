import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem function_identity (f : ℕ+ → ℕ+) (h : ∀ n, f (n + 1) > f (f n)) : ∀ n, f n = n := by

done