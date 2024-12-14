import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem jasmine_water_consumption : 
  /-- Jasmine drank 1.5 pints of water on the first 3 miles of her hike. If she continued at this rate, how many pints of water would she drink in the next 10 miles? Show that it is 5.-/ :=
by
  let rate := 1.5 / 3
  let water_in_10_miles := rate * 10
  have h₀ : water_in_10_miles = 5 := by norm_num
  exact h₀

done