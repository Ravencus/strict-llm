import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem graphs_intersection : 
  /-- The graphs of $y=x^4$ and $y=5x^2-6$ intersect at four points with $x$-coordinates $\pm \sqrt{m}$ and $\pm \sqrt{n}$, where $m > n$. What is $m-n$? Show that it is 1.-/ :=
begin
  let f := λ x : ℝ, x^4,
  let g := λ x : ℝ, 5*x^2 - 6,
  have h_intersect : ∀ x, f x = g x ↔ x^4 = 5*x^2 - 6,
  { intro x, refl },
  have h_solutions : ∀ x, x^4 - 5*x^2 + 6 = 0 ↔ (x^2 - 2)*(x^2 - 3) = 0,
  { intro x, ring_nf, },
  have h_roots : ∀ x, (x^2 - 2)*(x^2 - 3) = 0 ↔ x^2 = 2 ∨ x^2 = 3,
  { intro x, split; intro h,
    { cases h,
      { left, exact h },
      { right, exact h } },
    { cases h,
      { left, exact h },
      { right, exact h } } },
  have h_x_coords : ∀ x, x^2 = 2 ∨ x^2 = 3 ↔ x = real.sqrt 2 ∨ x = -real.sqrt 2 ∨ x = real.sqrt 3 ∨ x = -real.sqrt 3,
  { intro x, split; intro h,
    { cases h,
      { left, exact real.sqrt_eq_iff_sq_eq.2 ⟨real.sqrt_nonneg 2, h⟩ },
      { right, left, exact real.sqrt_eq_iff_sq_eq.2 ⟨real.sqrt_nonneg 3, h⟩ } },
    { cases h,
      { left, exact (real.sqrt_eq_iff_sq_eq.1 h).2 },
      { cases h,
        { right, exact (real.sqrt_eq_iff_sq_eq.1 h).2 },
        { cases h,
          { left, exact (real.sqrt_eq_iff_sq_eq.1 h).2 },
          { right, exact (real.sqrt_eq_iff_sq_eq.1 h).2 } } } } },
  have h_m_n : ∀ m n, m = 3 ∧ n = 2,
  { intros m n, split; refl },
  have h_m_n_diff : ∀ m n, m - n = 1,
  { intros m n, rw h_m_n m n, refl },
  exact h_m_n_diff 3 2,
end

done