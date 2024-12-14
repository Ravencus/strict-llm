import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem father's_age_in_base_ten : 
  /-- My father's age is $1222_{3}$, in base three to represent his three lower limbs -- two legs and a cane.  How old is he in base ten? Show that it is 53.-/ := by
  have h : 1 * 3^3 + 2 * 3^2 + 2 * 3^1 + 2 * 3^0 = 53,
  { norm_num },
  exact h

done