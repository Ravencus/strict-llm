import Mathlib

open Filter Real Function
open scoped Topology



theorem sum_converges_when_p_gt_1 : 
  ∀ (p : ℝ) (hp : p > 1), ¬ ∃ l, Tendsto (λ (k : ℕ), (1 : ℝ) / (k * (log k) ^ p)) atTop (𝓝 l) := by

done