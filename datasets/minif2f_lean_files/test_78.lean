import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem arithmetic_sequence_fifth_term :
  ∃ (a d : ℚ), (∀ n, u n = a + n * d) ∧ u 1 = 2/3 ∧ u 9 = 4/5 ∧ u 5 = 11/15 :=
begin
  -- Define the arithmetic sequence
  let u : ℕ → ℚ := λ n, a + n * d,
  -- Given conditions
  have h₁ : u 1 = 2/3 := by simp [u],
  have h₂ : u 9 = 4/5 := by simp [u],
  -- Solve for a and d
  have : ∀ n, u n = a + n * d := by simp [u],
  -- Calculate the fifth term
  have h₃ : u 5 = 11/15 := by simp [u],
  -- Show the existence of a and d
  use [a, d],
  split,
  { exact this },
  split,
  { exact h₁ },
  split,
  { exact h₂ },
  { exact h₃ },
end

done