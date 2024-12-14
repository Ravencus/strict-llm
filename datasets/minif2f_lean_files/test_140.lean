import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem prime_divides_ap_minus_a (p a : ℕ) (hp : Nat.Prime p) (ha : 0 < a) : p ∣ a^p - a := by

done