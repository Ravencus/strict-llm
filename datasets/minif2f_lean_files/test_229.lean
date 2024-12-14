import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem smallest_even_integer_is_8 : 
  ∃ a : ℕ, (∀ n, n ∈ (list.range 5).map (λ i, 2 * a + 2 * i)) ∧ 
  (list.sum ((list.range 5).map (λ i, 2 * a + 2 * i)) = 
   list.sum ((list.range 8).map (λ i, 2 * i + 1)) - 4) ∧ 
  a = 8 := 
begin
  let even_integers := (list.range 5).map (λ i, 2 * 8 + 2 * i),
  let odd_integers := (list.range 8).map (λ i, 2 * i + 1),
  have h₀ : list.sum even_integers = list.sum odd_integers - 4,
  { simp [even_integers, odd_integers, list.sum_map, list.range, list.sum_range_succ],
    norm_num },
  use 8,
  split,
  { intros n hn,
    simp [even_integers, list.mem_map, list.range] at hn,
    rcases hn with ⟨i, hi, rfl⟩,
    exact ⟨i, hi, rfl⟩ },
  split,
  { exact h₀ },
  { refl }
end

done