import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem value_of_expression : (∑ k in finset.range 20, real.log (3 ^ (k^2)) / real.log (5^k)) * 
                              (∑ k in finset.range 100, real.log (25^k) / real.log (9^k)) = 21000 := by

done