import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem sum_modulo_zero : 
  let S = 2010 + 2011 + ... + 4018 in 
  S % 2009 = 0 := by

done