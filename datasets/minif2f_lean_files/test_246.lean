import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem find_k_m_n : 
  ∃ (k m n : ℕ), (1 + sin t) * (1 + cos t) = 5 / 4 ∧ 
  (1 - sin t) * (1 - cos t) = m / n - real.sqrt k ∧ 
  nat.coprime m n ∧ 
  k + m + n = 27 := 
by

done