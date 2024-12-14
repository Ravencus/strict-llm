import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem evaluate_inverse_sum_mod_p (p : ℕ) (h₀ : Nat.Prime p) (h₁ : 7 ≤ p) :
  (∑ i in Finset.range (p - 1), (i⁻¹ : ZMod p) * ((i + 1)⁻¹ : ZMod p)) = 2 := by

done