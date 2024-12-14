import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem determine_functions : ∀ (f : ℤ → ℤ), (∀ a b : ℤ, f (2 * a) + 2 * f b = f (f (a + b))) := by

done