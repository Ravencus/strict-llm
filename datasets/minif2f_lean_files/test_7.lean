import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem cone_volume : 
  let B := 30 in
  let h := 6.5 in
  let V := (1/3) * B * h in
  V = 65 := by
  simp [B, h, V]
  norm_num

done