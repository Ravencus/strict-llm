import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem sum_of_cubes_eq_square_of_sum : ∀ (n : ℕ), ∑ k in Finset.range n, k^3 = (∑ k in Finset.range n, k)^2 := by

done