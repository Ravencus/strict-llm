import Mathlib

open Topology Filter Real Complex TopologicalSpace Finset
open scoped BigOperators



theorem condensation_points_countable_complement 
  (k : ℕ) (E P : Set (EuclideanSpace ℝ (Fin k)))
  (hE : E.Nonempty ∧ ¬ Set.Countable E)
  (hP : P = {x | ∀ U ∈ 𝓝 x, ¬ Set.Countable (P ∩ E)}) :
  Set.Countable (E \ P) := by

done