import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem false_statement : ¬ (∀ a b : ℤ, (even a ∧ even b) ↔ (8 ∣ a^2 + b^2)) := by

done