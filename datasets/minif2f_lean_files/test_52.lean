import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem nice_numbers_sum : 
  ∃ (n : ℕ), (∀ m : ℕ, (m > 0) → (∃ a b : ℕ, m = a * b ∧ a ≠ b ∧ a ≠ 1 ∧ b ≠ 1) → 
  (∃ d1 d2 d3 d4 : ℕ, {d1, d2, d3, d4} = {1, a, b, m} ∧ d1 + d2 + d3 + d4 = n)) ∧ 
  (∀ n ∈ {2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019}, 
  ∃ m : ℕ, (m > 0) ∧ (∃ a b : ℕ, m = a * b ∧ a ≠ b ∧ a ≠ 1 ∧ b ≠ 1) ∧ 
  (∃ d1 d2 d3 d4 : ℕ, {d1, d2, d3, d4} = {1, a, b, m} ∧ d1 + d2 + d3 + d4 = n)) ∧ 
  (∑ n in {2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019}, n) = 2016 := by

done