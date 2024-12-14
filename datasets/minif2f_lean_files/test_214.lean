import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem find_ax5_by5 (a b x y : ℝ) 
  (h1 : ax + by = 3) 
  (h2 : ax^2 + by^2 = 7) 
  (h3 : ax^3 + by^3 = 16) 
  (h4 : ax^4 + by^4 = 42) : 
  ax^5 + by^5 = 20 := 
by
-- Proof goes here

done