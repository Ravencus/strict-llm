import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem sum_of_gcd_values : 
  let f (x : ℕ) := 12 * x + 7,
      g (x : ℕ) := 5 * x + 2,
      h (x : ℕ) := Nat.gcd (f x) (g x) in
  (∀ x, 0 < x → x ∈ ℕ) →
  (∑ x in {x : ℕ | 0 < x}, h x) = 12 := 
by
  -- Proof goes here

done