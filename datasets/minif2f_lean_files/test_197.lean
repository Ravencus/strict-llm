import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem first_term_of_arithmetic_series :
  ∃ (a d : ℝ), (∑ i in finset.range 5, (a + i * d) = 70) ∧ 
               (∑ i in finset.range 10, (a + i * d) = 210) ∧ 
               a = 42 / 5 := 
begin
  -- Let the first term be `a` and the common difference be `d`.
  -- The sum of the first 5 terms is given by the formula: S₅ = 5/2 * (2a + 4d) = 70
  -- The sum of the first 10 terms is given by the formula: S₁₀ = 10/2 * (2a + 9d) = 210
  -- Solving these two equations will give us the values of `a` and `d`.
  let S₅ := 5 / 2 * (2 * a + 4 * d),
  let S₁₀ := 10 / 2 * (2 * a + 9 * d),
  have h₁ : S₅ = 70 := by linarith,
  have h₂ : S₁₀ = 210 := by linarith,
  -- Solve the system of equations
  have : 5 * (2 * a + 4 * d) = 140 := by linarith,
  have : 5 * (2 * a + 9 * d) = 210 := by linarith,
  -- Subtract the first equation from the second
  have : 5 * (2 * a + 9 * d) - 5 * (2 * a + 4 * d) = 210 - 140 := by linarith,
  have : 5 * 5 * d = 70 := by linarith,
  have : 25 * d = 70 := by linarith,
  have : d = 70 / 25 := by linarith,
  have : d = 14 / 5 := by linarith,
  -- Substitute back to find `a`
  have : 5 * (2 * a + 4 * (14 / 5)) = 140 := by linarith,
  have : 5 * (2 * a + 56 / 5) = 140 := by linarith,
  have : 2 * a + 56 / 5 = 28 := by linarith,
  have : 2 * a = 28 - 56 / 5 := by linarith,
  have : 2 * a = 140 / 5 - 56 / 5 := by linarith,
  have : 2 * a = 84 / 5 := by linarith,
  have : a = 42 / 5 := by linarith,
  -- Conclusion
  use [42 / 5, 14 / 5],
  split,
  { exact h₁ },
  split,
  { exact h₂ },
  { refl }
end

done