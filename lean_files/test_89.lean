import Mathlib

open Real
open scoped BigOperators



theorem scalar_multiple_of_identity {F V : Type*} [Field F] [AddCommGroup V] [Module F V] 
  {T : End F V} (h : ∀ (U : Submodule F V), U.dim = (Module.rank F V) - 1 → T '' U ≤ U) : 
  ∃ c : F, T = c • LinearMap.id

done