import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem find_f_f_10 : 
  (σ : Equiv ℝ ℝ) (h₁ : σ.2 2 = 10) (h₂ : σ.2 10 = 1) (h₃ : σ.2 1 = 2) : 
  σ.1 (σ.1 10) = 1 := 
by
  rw [←h₂, ←h₃, ←h₁]

done