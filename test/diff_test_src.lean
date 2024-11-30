import Mathlib.Tactic
namespace DiffTest
set_option linter.unusedVariables false

def TendsTo (a : ℕ → ℝ) (t : ℝ) : Prop :=
  ∀ ε > 0, ∃ B : ℕ, ∀ n, B ≤ n → |a n - t| < ε


theorem tendsTo_def {a : ℕ → ℝ} {t : ℝ} :
    TendsTo a t ↔ ∀ ε, 0 < ε → ∃ B : ℕ, ∀ n, B ≤ n → |a n - t| < ε := by
  rfl  -- true by definition

theorem tendsTo_thirtyseven : TendsTo (fun n ↦ 37) 37 :=
  by
  rw [tendsTo_def]
  intro ε hε
  use 100
  intro n hn
  norm_num
  exact hε



end DiffTest
