import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem find_m_plus_n : 
  ∃ (m n : ℕ), (∑ k in Finset.range 35, real.sin (5 * k)) = real.tan (m / n) ∧ 
  nat.coprime m n ∧ m / n < 90 ∧ m + n = 177 := by

done