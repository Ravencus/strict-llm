import Mathlib

open Topology Filter Real Complex TopologicalSpace Finset
open scoped BigOperators



theorem continuous_open_mapping_monotonic {f : (Metric.sphere 0 1 : Set ℝ) → ℝ} (hf : Continuous f) : Monotonic f := by

done