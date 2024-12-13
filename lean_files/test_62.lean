import Mathlib

open Filter Real Function
open scoped Topology



theorem open_iff_no_limit_points_of_complement {M : Type*} [TopologicalSpace M] (U : Set M) :
  IsOpen U ↔ ∀ x ∈ U, x ∉ closure (Uᶜ) := by

done