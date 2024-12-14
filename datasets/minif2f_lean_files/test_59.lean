import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem largest_negative_integer : IsLeast { x : ℤ | 24 * x ≡ 15 [MOD 1199] } (-449) := by

done