import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem count_divisible_by_20 : 
  Finset.card (Finset.filter (fun x => x % 20 = 0) (Finset.Icc 15 85)) = 4 := by

done