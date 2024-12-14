import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



```lean
theorem fibonacci_100th_term_mod_4 : 
  /-- The Fibonacci sequence is the sequence 1, 1, 2, 3, 5, $\ldots$ where each term is the sum of the previous two terms. What is the remainder when the $100^{\mathrm{th}}$ term of the sequence is divided by 4? Show that it is 3.-/ :=
begin
  let fib : ℕ → ℕ := λ n, nat.rec_on n 1 (λ n fib_n, nat.rec_on n 1 (λ n fib_n1, fib_n + fib_n1)),
  have h₀ : ∀ n, fib (n + 2) = fib (n + 1) + fib n,
  { intro n, exact nat.rec_on n rfl (λ n ih, rfl) },
  have h₁ : fib 0 = 1, from rfl,
  have h₂ : fib 1 = 1, from rfl,
  have h₃ : fib 2 = 2, from rfl,
  have h₄ : fib 3 = 3, from rfl,
  have h₅ : fib 4 = 5, from rfl,
  have h₆ : fib 5 = 8, from rfl,
  have h₇ : fib 6 = 13, from rfl,
  have h₈ : fib 7 = 21, from rfl,
  have h₉ : fib 8 = 34, from rfl,
  have h₁₀ : fib 9 = 55, from rfl,
  have h₁₁ : fib 10 = 89, from rfl,
  have h₁₂ : fib 11 = 144, from rfl,
  have h₁₃ : fib 12 = 233, from rfl,
  have h₁₄ : fib 13 = 377, from rfl,
  have h₁₅ : fib 14 = 610, from rfl,
  have h₁₆ : fib 15 = 987, from rfl,
  have h₁₇ : fib 16 = 1597, from rfl,
  have h₁₈ : fib 17 = 2584, from rfl,
  have h₁₉ : fib 18 = 4181, from rfl,
  have h₂₀ : fib 19 = 6765, from rfl,
  have h₂₁ : fib 20 = 10946, from rfl,
  have h₂₂ : fib 21 = 17711, from rfl,
  have h₂₃ : fib 22 = 28657, from rfl,
  have h₂₄ : fib 23 = 46368, from rfl,
  have h₂₅ : fib 24 = 75025, from rfl,
  have h₂₆ : fib 25 = 121393, from rfl,
  have h₂₇ : fib 26 = 196418, from rfl,
  have h₂₈ : fib 27 = 317811, from rfl,
  have h₂₉ : fib 28 = 514229, from rfl,
  have h₃₀ : fib 29 = 832040, from rfl,
  have h₃₁ : fib 30 = 1346269, from rfl,
  have h₃₂ : fib 31 = 2178309, from rfl,
  have h₃₃ : fib 32 = 3524578, from rfl,
  have h₃₄ : fib 33 = 5702887, from rfl,
  have h₃₅ : fib 34 = 9227465, from rfl,
  have h₃₆ : fib 35 = 14930352, from rfl,
  have h₃₇ : fib 36 = 24157817, from rfl,
  have h₃₈ : fib 37 = 39088169, from rfl,
  have h₃₉ : fib 38 = 63245986, from rfl,
  have h₄₀ : fib 39 = 102334155, from rfl,
  have h₄₁ : fib 40 = 165580141, from rfl,
  have h₄₂ : fib 41 = 267914296, from rfl,
  have h₄₃ : fib 42 = 433494437, from rfl,
  have h₄₄ : fib 43 = 701

done