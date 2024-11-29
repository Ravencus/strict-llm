theorem add_comm (a b : Nat) : a + b = b + a := by
  induction b with
  | zero =>
    rw [Nat.add_zero, Nat.zero_add]
  -- | succ d hd =>
    -- rw [Nat.add_succ, hd, Nat.succ_add]
