import Mathlib

open Filter Real Function
open scoped Topology



theorem uniform_continuous_iff_modulus_of_continuity {f : ℝ → ℝ} (hf : Continuous f) (a b : ℝ) (hab : a < b) :
  (∃ μ : (0, ∞) → (0, ∞), Continuous μ ∧ StrictMono μ ∧ (∀ s, μ s → 0 as s → 0) ∧ (∀ s t ∈ [a, b], |f s - f t| ≤ μ (|s - t|))) ↔ UniformContinuous f :=
by

done