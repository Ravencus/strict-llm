import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem integer_solution_count : 
  /-- How many integers are in the solution set of $|x-2|\leq5.6$ ? Show that it is 11.-/ :=
by
  let f : ℤ → ℝ := λ x, abs (x - 2)
  let s : Finset ℤ := { x | f x ≤ 5.6 }.to_finset
  have h₁ : ∀ x, x ∈ s ↔ f x ≤ 5.6 := by simp [s]
  have h₂ : s.card = 11 := by
    -- Calculate the range of integers satisfying the inequality
    have : ∀ x : ℤ, f x ≤ 5.6 ↔ -3.6 ≤ x ∧ x ≤ 7.6 := by
      intro x
      rw [abs_le]
      split
      · intro h
        split
        · linarith
        · linarith
      · intro h
        cases h
        linarith
    -- Determine the integer bounds
    have : s = {x | -3 ≤ x ∧ x ≤ 7}.to_finset := by
      ext x
      simp [this]
      split
      · intro h
        split
        · linarith
        · linarith
      · intro h
        cases h
        linarith
    -- Calculate the number of integers in the set
    rw [this]
    simp
  exact h₂

done