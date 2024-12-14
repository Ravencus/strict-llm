import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem find_value_of_expression : 
  ∀ (a : ℝ), 0 < a ∧ (a⁻¹ - ⌊a⁻¹⌋ = a^2 - ⌊a^2⌋) ∧ 2 < a^2 ∧ a^2 < 3 → a^12 - 144 * a⁻¹ = 233 := 
by

done