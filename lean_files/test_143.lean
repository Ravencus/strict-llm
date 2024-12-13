import Mathlib

open Filter Set TopologicalSpace
open scoped Topology



theorem rational_basis_generates_standard_topology :
  (generateFrom {S : Set ℝ | ∃ a b : ℚ, a < b ∧ S = Ico ↑a ↑b}).IsOpen = (topological_space.generate_from {S : Set ℝ | ∃ a b : ℚ, a < b ∧ S = Ioo ↑a ↑b}).IsOpen := by

done