import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem number_property : 
  let a := (p : ℕ) / (q : ℕ) in
  (∀ p q : ℕ, nat.coprime p q → 
    (∃ S : finset ℝ, 
      (∀ x : ℝ, x ∈ S ↔ ⌊x⌋ * (x - ⌊x⌋) = a * x^2) ∧ 
      S.sum id = 420) → 
    p + q = 929) := 
by

done