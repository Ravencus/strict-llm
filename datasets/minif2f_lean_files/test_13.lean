import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem periodic_cosine_sum {a : ℕ → ℝ} {x₁ x₂ : ℝ} (h₀ : ∀ i, 1 ≤ i → i ≤ n → a i ∈ ℝ) 
  (hx₁ : f x₁ = 0) (hx₂ : f x₂ = 0) : ∃ m : ℤ, x₂ - x₁ = m * π :=
begin
  -- Proof goes here
end

done