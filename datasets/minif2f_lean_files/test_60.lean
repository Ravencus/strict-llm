import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem fraction_irreducible : ∀ (n : ℕ), nat.coprime (21 * n + 4) (14 * n + 3) := by

done