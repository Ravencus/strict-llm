import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem f_divides_f : ∀ (m n : ℕ), 0 < m → 0 < n → m ≤ n → (4^(2^m) + 6^(2^m) + 9^(2^m)) ∣ (4^(2^n) + 6^(2^n) + 9^(2^n)) := by

done