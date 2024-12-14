import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem irrational_exponents_rational : ∃ (a b : ℝ), irrational a ∧ irrational b ∧ ∃ q : ℚ, a^b = q := by

done