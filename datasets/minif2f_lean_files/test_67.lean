import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem value_of_g_f_5_minus_1 : 
  let f (x : ℝ) := 2 * x - 3,
      g (x : ℝ) := x + 1 in
  g (f 5 - 1) = 7 := by
  simp [f, g]

done