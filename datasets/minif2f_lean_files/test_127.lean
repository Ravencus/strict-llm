import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem find_f_of_4 : 
  let f : ℤ → ℤ := λ n, if n % 2 = 1 then n^2 else n^2 - 4*n - 1 in
  f (f (f (f (f 4)))) = 1 := by
  let f : ℤ → ℤ := λ n, if n % 2 = 1 then n^2 else n^2 - 4*n - 1
  have h₁ : f 4 = 11, by simp [f]; norm_num
  have h₂ : f 11 = 121, by simp [f]; norm_num
  have h₃ : f 121 = 14641, by simp [f]; norm_num
  have h₄ : f 14641 = 214358881, by simp [f]; norm_num
  have h₅ : f 214358881 = 1, by simp [f]; norm_num
  exact h₅

done