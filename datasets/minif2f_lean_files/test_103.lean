import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem max_value_of_expression : 
  ∀ (A M C : ℕ), A + M + C = 12 → 
  A * M * C + A * M + M * C + A * C ≤ 112 := 
begin
  intros A M C h,
  -- We need to show that the maximum value of the expression is 112
  -- under the constraint A + M + C = 12.
  -- We can use the AM-GM inequality or test values to find the maximum.
  -- Let's test values:
  have h1 : A = 4, M = 4, C = 4,
  { -- Check if A = 4, M = 4, C = 4 satisfies the constraint
    rw [h1, h1, h1] at h,
    exact h,
  },
  -- Calculate the expression for A = 4, M = 4, C = 4
  have h2 : A * M * C + A * M + M * C + A * C = 112,
  { -- Substitute A = 4, M = 4, C = 4 into the expression
    rw [h1, h1, h1],
    norm_num,
  },
  -- Show that this is the maximum value
  exact le_of_eq h2,
end

done