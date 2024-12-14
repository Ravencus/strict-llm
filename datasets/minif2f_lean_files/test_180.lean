import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem marble_game : 
  let total_marbles := 239 + 174 + 83 in
  let piles_of_10 := total_marbles / 10 in
  let marbles_to_remove := total_marbles % 10 in
  marbles_to_remove = 6 := by
  let total_marbles := 239 + 174 + 83
  let piles_of_10 := total_marbles / 10
  let marbles_to_remove := total_marbles % 10
  have h : total_marbles = 239 + 174 + 83 := rfl
  have h1 : total_marbles = 496 := by norm_num
  have h2 : piles_of_10 = 49 := by norm_num
  have h3 : marbles_to_remove = 6 := by norm_num
  exact h3

done