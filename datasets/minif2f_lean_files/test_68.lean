import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem distance_between_intersections : 
  let intersections := {p : ℝ × ℝ | p.2 = p.1^2 ∧ p.1 + p.2 = 1} in
  let p1 := (1 - real.sqrt 5) / 2 in
  let p2 := (1 + real.sqrt 5) / 2 in
  let distance := real.sqrt ((p2 - p1)^2 + ((p2^2) - (p1^2))^2) in
  distance = real.sqrt 10 := by

done