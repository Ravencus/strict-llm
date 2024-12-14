import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem area_change : 
  let original_area := 3491 * 3491,
      new_area := (3491 - 60) * (3491 + 60) in
  original_area - new_area = 3600 := by
  let original_area := 3491 * 3491
  let new_area := (3491 - 60) * (3491 + 60)
  have h : original_area - new_area = (3491^2 - (3491 - 60) * (3491 + 60)),
  { rw [original_area, new_area] },
  rw h,
  calc
    3491^2 - (3491 - 60) * (3491 + 60)
        = 3491^2 - (3491^2 - 60^2) : by ring
    ... = 60^2 : by ring
    ... = 3600 : by norm_num

done