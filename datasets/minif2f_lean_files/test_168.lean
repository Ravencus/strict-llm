import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem son_age_today : /-- Today a father's age is five times his son's age. Exactly three years ago, the sum of their ages was 30. How old is the son today? Show that it is 6.-/ := by
  let son_age := 6
  let father_age := 5 * son_age
  have h₁ : father_age = 5 * son_age := rfl
  have h₂ : (father_age - 3) + (son_age - 3) = 30 := by
    calc
      (father_age - 3) + (son_age - 3)
          = (5 * son_age - 3) + (son_age - 3) : by rw h₁
      ... = 5 * son_age + son_age - 6 : by ring
      ... = 6 * son_age - 6 : by ring
      ... = 6 * 6 - 6 : by rw [son_age]
      ... = 36 - 6 : by norm_num
      ... = 30 : by norm_num
  show son_age = 6 from rfl

done