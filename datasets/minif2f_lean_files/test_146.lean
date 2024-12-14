import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem find_current : 
  let V : ℂ := 1 + Complex.I,
      Z : ℂ := 2 - Complex.I,
      I : ℂ := V / Z
  in I = (1/5) + (3/5) * Complex.I := by
  have hV : V = 1 + Complex.I := rfl,
  have hZ : Z = 2 - Complex.I := rfl,
  have hI : I = V / Z := rfl,
  calc I = (1 + Complex.I) / (2 - Complex.I) : by rw [hI, hV, hZ]
     ... = ((1 + Complex.I) * (2 + Complex.I)) / ((2 - Complex.I) * (2 + Complex.I)) : by rw Complex.div_eq_mul_conj
     ... = (2 + Complex.I + 2 * Complex.I + Complex.I * Complex.I) / (4 + 1) : by ring
     ... = (2 + 3 * Complex.I - 1) / 5 : by simp [Complex.I_mul_I]
     ... = (1 + 3 * Complex.I) / 5 : by ring
     ... = (1/5) + (3/5) * Complex.I : by field_simp

done