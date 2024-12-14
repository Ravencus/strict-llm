import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem smallest_integer_greater_than_10_perfect_square_and_cube : 
  ∃ n : ℕ, n > 10 ∧ n = 64 ∧ ∃ m : ℕ, n = m^2 ∧ n = m^3 := by
  use 64
  split
  { norm_num }
  split
  { refl }
  use 4
  split
  { norm_num }
  { norm_num }

done