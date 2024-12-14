import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem real_numbers_satisfying_inequality :
  {x : ℝ | Real.sqrt (Real.sqrt (3 - x) - Real.sqrt (x + 1)) > 1 / 2} = 
  Icc (-1 : ℝ) (1 - Real.sqrt 127 / 32) := by

done