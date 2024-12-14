import Mathlib

open Filter Real Function
open scoped Topology



theorem nested_decreasing_intersection_nonempty {X : Type*} [TopologicalSpace X] [CompactSpace X] :
  ∀ (C : ℕ → Set X), (∀ n, IsClosed (C n)) ∧ (∀ n, C n ≠ ∅) ∧ (∀ n, C n ⊆ C (n + 1)) → ∃ x, ∀ n, x ∈ C n :=
begin
  intros C h,
  have h_compact : ∀ n, IsCompact (C n),
  { intro n,
    exact is_closed.is_compact (h.1 n), },
  obtain ⟨x, hx⟩ := countably_compact_iff_seq_compact.mp (compact_space.countably_compact X) C h,
  exact ⟨x, hx⟩,
end

done