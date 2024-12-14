import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem value_of_expression : a = 8 → (16 * real.cbrt (a^2))^(1/3) = 4 := by

done