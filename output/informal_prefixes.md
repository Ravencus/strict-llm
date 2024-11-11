# Informal Prefixes from ProofNet

## Statement 1
/-- Suppose that $f$ is holomorphic in an open set $\Omega$. Prove that if $\text{Re}(f)$ is constant, then $f$ is constant.-/


```lean
theorem exercise_1_13a {f : ℂ → ℂ} (Ω : Set ℂ) (a b : Ω) (h : IsOpen Ω)
  (hf : DifferentiableOn ℂ f Ω) (hc : ∃ (c : ℝ), ∀ z ∈ Ω, (f z).re = c) :
  f a = f b :=
```

## Statement 2
/-- Suppose that $f$ is holomorphic in an open set $\Omega$. Prove that if $\text{Im}(f)$ is constant, then $f$ is constant.-/


```lean
theorem exercise_1_13b {f : ℂ → ℂ} (Ω : Set ℂ) (a b : Ω) (h : IsOpen Ω)
  (hf : DifferentiableOn ℂ f Ω) (hc : ∃ (c : ℝ), ∀ z ∈ Ω, (f z).im = c) :
  f a = f b :=
```

## Statement 3
/-- Suppose that $f$ is holomorphic in an open set $\Omega$. Prove that if $|f|$ is constant, then $f$ is constant.-/


```lean
theorem exercise_1_13c {f : ℂ → ℂ} (Ω : Set ℂ) (a b : Ω) (h : IsOpen Ω)
  (hf : DifferentiableOn ℂ f Ω) (hc : ∃ (c : ℝ), ∀ z ∈ Ω, abs (f z) = c) :
  f a = f b :=
```

## Statement 4
/-- Prove that the power series $\sum nz^n$ does not converge on any point of the unit circle.-/


```lean
theorem exercise_1_19a (z : ℂ) (hz : abs z = 1) (s : ℕ → ℂ)
    (h : s = (λ n => ∑ i in (range n), i * z ^ i)) :
    ¬ ∃ y, Tendsto s atTop (𝓝 y) :=
```

## Statement 5
/-- Prove that the power series $\sum zn/n^2$ converges at every point of the unit circle.-/


```lean
theorem exercise_1_19b (z : ℂ) (hz : abs z = 1) (s : ℕ → ℂ)
    (h : s = (λ n => ∑ i in (range n), i * z / i ^ 2)) :
    ∃ y, Tendsto s atTop (𝓝 y) :=
```

## Statement 6
/-- Prove that the power series $\sum zn/n$ converges at every point of the unit circle except $z = 1$.-/


```lean
theorem exercise_1_19c (z : ℂ) (hz : abs z = 1) (hz2 : z ≠ 1) (s : ℕ → ℂ)
    (h : s = (λ n => ∑ i in (range n), i * z / i)) :
    ∃ z, Tendsto s atTop (𝓝 z) :=
```

## Statement 7
/-- Suppose $f$ is continuous in a region $\Omega$. Prove that any two primitives of $f$ (if they exist) differ by a constant.-/


```lean
theorem exercise_1_26
  (f F₁ F₂ : ℂ → ℂ) (Ω : Set ℂ) (h1 : IsOpen Ω) (h2 : IsConnected Ω)
  (hF₁ : DifferentiableOn ℂ F₁ Ω) (hF₂ : DifferentiableOn ℂ F₂ Ω)
  (hdF₁ : ∀ x ∈ Ω, deriv F₁ x = f x) (hdF₂ : ∀ x ∈ Ω, deriv F₂ x = f x)
  : ∃ c : ℂ, ∀ x, F₁ x = F₂ x + c :=
```

## Statement 8
/-- Show that $\int_{0}^{\infty} \frac{\sin x}{x} d x=\frac{\pi}{2}$.-/


```lean
theorem exercise_2_2 :
  Tendsto (λ y => ∫ x in (0 : ℝ)..y, Real.sin x / x) atTop (𝓝 (Real.pi / 2)) :=
```

## Statement 9
/-- Let $\Omega$ be a bounded open subset of $\mathbb{C}$, and $\varphi: \Omega \rightarrow \Omega$ a holomorphic function. Prove that if there exists a point $z_{0} \in \Omega$ such that $\varphi\left(z_{0}\right)=z_{0} \quad \text { and } \quad \varphi^{\prime}\left(z_{0}\right)=1$ then $\varphi$ is linear.-/


```lean
theorem exercise_2_9
  {f : ℂ → ℂ} (Ω : Set ℂ) (b : Bornology.IsBounded Ω) (h : IsOpen Ω)
  (hf : DifferentiableOn ℂ f Ω) (z : Ω) (hz : f z = z) (h'z : deriv f z = 1) :
  ∃ (f_lin : ℂ →L[ℂ] ℂ), ∀ x ∈ Ω, f x = f_lin x :=
```

## Statement 10
/-- Suppose $f$ is an analytic function defined everywhere in $\mathbb{C}$ and such that for each $z_0 \in \mathbb{C}$ at least one coefficient in the expansion $f(z) = \sum_{n=0}^\infty c_n(z - z_0)^n$ is equal to 0. Prove that $f$ is a polynomial.-/


```lean
theorem exercise_2_13 {f : ℂ → ℂ}
    (hf : ∀ z₀ : ℂ, ∃ (s : Set ℂ) (c : ℕ → ℂ), IsOpen s ∧ z₀ ∈ s ∧
      ∀ z ∈ s, Tendsto (λ n => ∑ i in range n, (c i) * (z - z₀)^i) atTop (𝓝 (f z₀))
      ∧ ∃ i, c i = 0) :
    ∃ (c : ℕ → ℂ) (n : ℕ), f = λ z => ∑ i in range n, (c i) * z ^ n :=
```

## Statement 11
/-- Show that $ \int_{-\infty}^{\infty} \frac{\cos x}{x^2 + a^2} dx = \pi \frac{e^{-a}}{a}$ for $a > 0$.-/


```lean
theorem exercise_3_3 (a : ℝ) (ha : 0 < a) :
    Tendsto (λ y => ∫ x in -y..y, Real.cos x / (x ^ 2 + a ^ 2))
    atTop (𝓝 (Real.pi * (Real.exp (-a) / a))) :=
```

## Statement 12
/-- Show that $ \int_{-\infty}^{\infty} \frac{x \sin x}{x^2 + a^2} dx = \pi e^{-a}$ for $a > 0$.-/


```lean
theorem exercise_3_4 (a : ℝ) (ha : 0 < a) :
    Tendsto (λ y => ∫ x in -y..y, x * Real.sin x / (x ^ 2 + a ^ 2))
    atTop (𝓝 (Real.pi * (Real.exp (-a)))) :=
```

## Statement 13
/-- Show that $\int_0^1 \log(\sin \pi x) dx = - \log 2$.-/


```lean
theorem exercise_3_9 : ∫ x in (0 : ℝ)..(1 : ℝ),
    Real.log (Real.sin (Real.pi * x)) = - Real.log 2 :=
```

## Statement 14
/-- Prove that all entire functions that are also injective take the form $f(z) = az + b$, $a, b \in \mathbb{C}$ and $a \neq 0$.-/


```lean
theorem exercise_3_14 {f : ℂ → ℂ} (hf : Differentiable ℂ f)
    (hf_inj : Function.Injective f) :
    ∃ (a b : ℂ), f = (λ z => a * z + b) ∧ a ≠ 0 :=
```

## Statement 15
/-- Show that there is no holomorphic function $f$ in the unit disc $D$ that extends continuously to $\partial D$ such that $f(z) = 1/z$ for $z \in \partial D$.-/


```lean
theorem exercise_3_22 (D : Set ℂ) (hD : D = ball 0 1) (f : ℂ → ℂ)
    (hf : DifferentiableOn ℂ f D) (hfc : ContinuousOn f (closure D)) :
    ¬ ∀ z ∈ (sphere (0 : ℂ) 1), f z = 1 / z :=
```

## Statement 16
/-- Prove that if $f$ is holomorphic in the unit disc, bounded and not identically zero, and $z_{1}, z_{2}, \ldots, z_{n}, \ldots$ are its zeros $\left(\left|z_{k}\right|<1\right)$, then $\sum_{n}\left(1-\left|z_{n}\right|\right)<\infty$.-/


```lean
theorem exercise_5_1 (f : ℂ → ℂ) (hf : DifferentiableOn ℂ f (ball 0 1))
  (hb : Bornology.IsBounded (Set.range f)) (h0 : f ≠ 0) (zeros : ℕ → ℂ) (hz : ∀ n, f (zeros n) = 0)
  (hzz : Set.range zeros = {z | f z = 0 ∧ z ∈ (ball (0 : ℂ) 1)}) :
  ∃ (z : ℂ), Tendsto (λ n => (∑ i in range n, (1 - zeros i))) atTop (𝓝 z) :=
```

## Statement 17
/-- If $r$ is rational $(r \neq 0)$ and $x$ is irrational, prove that $r+x$ is irrational.-/


```lean
theorem exercise_1_1a
  (x : ℝ) (y : ℚ) :
  ( Irrational x ) -> Irrational ( x + y ) :=
```

## Statement 18
/-- If $r$ is rational $(r \neq 0)$ and $x$ is irrational, prove that $rx$ is irrational.-/


```lean
theorem exercise_1_1b
(x : ℝ)
(y : ℚ)
(h : y ≠ 0)
: ( Irrational x ) -> Irrational ( x * y ) :=
```

## Statement 19
/-- Prove that there is no rational number whose square is $12$.-/


```lean
theorem exercise_1_2 : ¬ ∃ (x : ℚ), ( x ^ 2 = 12 ) :=
```

## Statement 20
/-- Let $E$ be a nonempty subset of an ordered set; suppose $\alpha$ is a lower bound of $E$ and $\beta$ is an upper bound of $E$. Prove that $\alpha \leq \beta$.-/


```lean
theorem exercise_1_4
(α : Type*) [PartialOrder α]
(s : Set α)
(x y : α)
(h₀ : Set.Nonempty s)
(h₁ : x ∈ lowerBounds s)
(h₂ : y ∈ upperBounds s)
: x ≤ y :=
```

## Statement 21
/-- Let $A$ be a nonempty set of real numbers which is bounded below. Let $-A$ be the set of all numbers $-x$, where $x \in A$. Prove that $\inf A=-\sup (-A)$.-/


```lean
theorem exercise_1_5 (A minus_A : Set ℝ) (hA : A.Nonempty)
  (hA_bdd_below : BddBelow A) (hminus_A : minus_A = {x | -x ∈ A}) :
  Inf A = Sup minus_A :=
```

## Statement 22
/-- Prove that no order can be defined in the complex field that turns it into an ordered field.-/


```lean
theorem exercise_1_8 : ¬ ∃ (r : ℂ → ℂ → Prop), IsLinearOrder ℂ r :=
```

## Statement 23
/-- If $z$ is a complex number, prove that there exists an $r\geq 0$ and a complex number $w$ with $| w | = 1$ such that $z = rw$.-/


```lean
theorem exercise_1_11a (z : ℂ) :
  ∃ (r : ℝ) (w : ℂ), abs w = 1 ∧ z = r * w :=
```

## Statement 24
/-- If $z_1, \ldots, z_n$ are complex, prove that $|z_1 + z_2 + \ldots + z_n| \leq |z_1| + |z_2| + \cdots + |z_n|$.-/


```lean
theorem exercise_1_12 (n : ℕ) (f : ℕ → ℂ) :
  abs (∑ i in range n, f i) ≤ ∑ i in range n, abs (f i) :=
```

## Statement 25
/-- If $x, y$ are complex, prove that $||x|-|y|| \leq |x-y|$.-/


```lean
theorem exercise_1_13 (x y : ℂ) :
  |(abs x) - (abs y)| ≤ abs (x - y) :=
```

## Statement 26
/-- If $z$ is a complex number such that $|z|=1$, that is, such that $z \bar{z}=1$, compute $|1+z|^{2}+|1-z|^{2}$.-/


```lean
theorem exercise_1_14
  (z : ℂ) (h : abs z = 1)
  : (abs (1 + z)) ^ 2 + (abs (1 - z)) ^ 2 = 4 :=
```

## Statement 27
/-- Suppose $k \geq 3, x, y \in \mathbb{R}^k, |x - y| = d > 0$, and $r > 0$. Prove that if $2r > d$, there are infinitely many $z \in \mathbb{R}^k$ such that $|z-x|=|z-y|=r$.-/


```lean
theorem exercise_1_16a
  (n : ℕ)
  (d r : ℝ)
  (x y z : EuclideanSpace ℝ (Fin n)) -- R^n
  (h₁ : n ≥ 3)
  (h₂ : ‖x - y‖ = d)
  (h₃ : d > 0)
  (h₄ : r > 0)
  (h₅ : 2 * r > d)
  : Set.Infinite {z : EuclideanSpace ℝ (Fin n) | ‖z - x‖ = r ∧ ‖z - y‖ = r} :=
```

## Statement 28
/-- Prove that $|\mathbf{x}+\mathbf{y}|^{2}+|\mathbf{x}-\mathbf{y}|^{2}=2|\mathbf{x}|^{2}+2|\mathbf{y}|^{2}$ if $\mathbf{x} \in R^{k}$ and $\mathbf{y} \in R^{k}$.-/


```lean
theorem exercise_1_17
  (n : ℕ)
  (x y : EuclideanSpace ℝ (Fin n)) -- R^n
  : ‖x + y‖^2 + ‖x - y‖^2 = 2*‖x‖^2 + 2*‖y‖^2 :=
```

## Statement 29
/-- If $k \geq 2$ and $\mathbf{x} \in R^{k}$, prove that there exists $\mathbf{y} \in R^{k}$ such that $\mathbf{y} \neq 0$ but $\mathbf{x} \cdot \mathbf{y}=0$-/


```lean
theorem exercise_1_18a
  (n : ℕ)
  (h : n > 1)
  (x : EuclideanSpace ℝ (Fin n)) -- R^n
  : ∃ (y : EuclideanSpace ℝ (Fin n)), y ≠ 0 ∧ (inner x y) = (0 : ℝ) :=
```

## Statement 30
/-- If $k = 1$ and $\mathbf{x} \in R^{k}$, prove that there does not exist $\mathbf{y} \in R^{k}$ such that $\mathbf{y} \neq 0$ but $\mathbf{x} \cdot \mathbf{y}=0$-/


```lean
theorem exercise_1_18b
  : ¬ ∀ (x : ℝ), ∃ (y : ℝ), y ≠ 0 ∧ x * y = 0 :=
```

## Statement 31
/-- Suppose $a, b \in R^k$. Find $c \in R^k$ and $r > 0$ such that $|x-a|=2|x-b|$ if and only if $| x - c | = r$. Prove that $3c = 4b - a$ and $3r = 2 |b - a|$.-/


```lean
theorem exercise_1_19
  (n : ℕ)
  (a b c x : EuclideanSpace ℝ (Fin n))
  (r : ℝ)
  (h₁ : r > 0)
  (h₂ : 3 • c = 4 • b - a)
  (h₃ : 3 * r = 2 * ‖x - b‖)
  : ‖x - a‖ = 2 * ‖x - b‖ ↔ ‖x - c‖ = r :=
```

## Statement 32
/-- If $A$ and $B$ are disjoint closed sets in some metric space $X$, prove that they are separated.-/


```lean
theorem exercise_2_19a {X : Type*} [MetricSpace X]
  (A B : Set X) (hA : IsClosed A) (hB : IsClosed B) (hAB : Disjoint A B) :
  SeparatedNhds A B :=
```

## Statement 33
/-- Let $X$ be a metric space in which every infinite subset has a limit point. Prove that $X$ is separable.-/


```lean
theorem exercise_2_24 {X : Type*} [MetricSpace X]
  (hX : ∀ (A : Set X), Infinite A → ∃ (x : X), x ∈ closure A) :
  SeparableSpace X :=
```

## Statement 34
/-- Prove that every compact metric space $K$ has a countable base.-/


```lean
theorem exercise_2_25 {K : Type*} [MetricSpace K] [CompactSpace K] :
  ∃ (B : Set (Set K)), Set.Countable B ∧ IsTopologicalBasis B :=
```

## Statement 35
/-- Suppose $E\subset\mathbb{R}^k$ is uncountable, and let $P$ be the set of condensation points of $E$. Prove that $P$ is perfect.-/


```lean
theorem exercise_2_27a (k : ℕ) (E P : Set (EuclideanSpace ℝ (Fin k)))
  (hE : E.Nonempty ∧ ¬ Set.Countable E)
  (hP : P = {x | ∀ U ∈ 𝓝 x, ¬ Set.Countable (P ∩ E)}) :
  IsClosed P ∧ P = {x | ClusterPt x (𝓟 P)} :=
```

## Statement 36
/-- Suppose $E\subset\mathbb{R}^k$ is uncountable, and let $P$ be the set of condensation points of $E$. Prove that at most countably many points of $E$ are not in $P$.-/


```lean
theorem exercise_2_27b (k : ℕ) (E P : Set (EuclideanSpace ℝ (Fin k)))
  (hE : E.Nonempty ∧ ¬ Set.Countable E)
  (hP : P = {x | ∀ U ∈ 𝓝 x, (P ∩ E).Nonempty ∧ ¬ Set.Countable (P ∩ E)}) :
  Set.Countable (E \ P) :=
```

## Statement 37
/-- Prove that every closed set in a separable metric space is the union of a (possibly empty) perfect set and a set which is at most countable.-/


```lean
theorem exercise_2_28 (X : Type*) [MetricSpace X] [SeparableSpace X]
  (A : Set X) (hA : IsClosed A) :
  ∃ P₁ P₂ : Set X, A = P₁ ∪ P₂ ∧
  IsClosed P₁ ∧ P₁ = {x | ClusterPt x (𝓟 P₁)} ∧
  Set.Countable P₂ :=
```

## Statement 38
/-- Prove that every open set in $\mathbb{R}$ is the union of an at most countable collection of disjoint segments.-/


```lean
theorem exercise_2_29 (U : Set ℝ) (hU : IsOpen U) :
  ∃ (f : ℕ → Set ℝ), (∀ n, ∃ a b : ℝ, f n = {x | a < x ∧ x < b}) ∧ (∀ n, f n ⊆ U) ∧
  (∀ n m, n ≠ m → f n ∩ f m = ∅) ∧
  U = ⋃ n, f n :=
```

## Statement 39
/-- Prove that convergence of $\left\{s_{n}\right\}$ implies convergence of $\left\{\left|s_{n}\right|\right\}$.-/


```lean
theorem exercise_3_1a
  (f : ℕ → ℝ)
  (h : ∃ (a : ℝ), Tendsto (λ (n : ℕ) => f n) atTop (𝓝 a))
  : ∃ (a : ℝ), Tendsto (λ (n : ℕ) => |f n|) atTop (𝓝 a) :=
```

## Statement 40
/-- Prove that $\lim_{n \rightarrow \infty}\sqrt{n^2 + n} -n = 1/2$.-/


```lean
theorem exercise_3_2a
  : Tendsto (λ (n : ℝ) => (sqrt (n^2 + n) - n)) atTop (𝓝 (1/2)) :=
```

## Statement 41
/-- If $s_{1}=\sqrt{2}$, and $s_{n+1}=\sqrt{2+\sqrt{s_{n}}} \quad(n=1,2,3, \ldots),$ prove that $\left\{s_{n}\right\}$ converges, and that $s_{n}<2$ for $n=1,2,3, \ldots$.-/


```lean
theorem exercise_3_3
  : ∃ (x : ℝ), Tendsto f atTop (𝓝 x) ∧ ∀ n, f n < 2 :=
```

## Statement 42
/-- For any two real sequences $\left\{a_{n}\right\},\left\{b_{n}\right\}$, prove that $\limsup _{n \rightarrow \infty}\left(a_{n}+b_{n}\right) \leq \limsup _{n \rightarrow \infty} a_{n}+\limsup _{n \rightarrow \infty} b_{n},$ provided the sum on the right is not of the form $\infty-\infty$.-/


```lean
theorem exercise_3_5
  (a b : ℕ → ℝ)
  (h : limsup a + limsup b ≠ 0) :
  limsup (λ n => a n + b n) ≤ limsup a + limsup b :=
```

## Statement 43
/-- Prove that $\lim_{n \rightarrow \infty} \sum_{i<n} a_i = \infty$, where $a_i = \sqrt{i + 1} -\sqrt{i}$.-/


```lean
theorem exercise_3_6a
: Tendsto (λ (n : ℕ) => (∑ i in range n, g i)) atTop atTop :=
```

## Statement 44
/-- Prove that the convergence of $\Sigma a_{n}$ implies the convergence of $\sum \frac{\sqrt{a_{n}}}{n}$ if $a_n\geq 0$.-/


```lean
theorem exercise_3_7
  (a : ℕ → ℝ)
  (h : ∃ y, (Tendsto (λ n => (∑ i in (range n), a i)) atTop (𝓝 y))) :
  ∃ y, Tendsto (λ n => (∑ i in (range n), sqrt (a i) / n)) atTop (𝓝 y) :=
```

## Statement 45
/-- If $\Sigma a_{n}$ converges, and if $\left\{b_{n}\right\}$ is monotonic and bounded, prove that $\Sigma a_{n} b_{n}$ converges.-/


```lean
theorem exercise_3_8
  (a b : ℕ → ℝ)
  (h1 : ∃ y, (Tendsto (λ n => (∑ i in (range n), a i)) atTop (𝓝 y)))
  (h2 : Monotone b)
  (h3 : Bornology.IsBounded (Set.range b)) :
  ∃ y, Tendsto (λ n => (∑ i in (range n), (a i) * (b i))) atTop (𝓝 y) :=
```

## Statement 46
/-- Prove that the Cauchy product of two absolutely convergent series converges absolutely.-/


```lean
theorem exercise_3_13
  (a b : ℕ → ℝ)
  (ha : ∃ y, (Tendsto (λ n => (∑ i in (range n), |a i|)) atTop (𝓝 y)))
  (hb : ∃ y, (Tendsto (λ n => (∑ i in (range n), |b i|)) atTop (𝓝 y))) :
  ∃ y, (Tendsto (λ n => (∑ i in (range n),
  λ i => (∑ j in range (i + 1), a j * b (i - j)))) atTop (𝓝 y)) :=
```

## Statement 47
/-- Suppose $\left\{p_{n}\right\}$ is a Cauchy sequence in a metric space $X$, and some sequence $\left\{p_{n l}\right\}$ converges to a point $p \in X$. Prove that the full sequence $\left\{p_{n}\right\}$ converges to $p$.-/


```lean
theorem exercise_3_20 {X : Type*} [MetricSpace X]
  (p : ℕ → X) (l : ℕ) (r : X)
  (hp : CauchySeq p)
  (hpl : Tendsto (λ n => p (l * n)) atTop (𝓝 r)) :
  Tendsto p atTop (𝓝 r) :=
```

## Statement 48
/-- If $\left\{E_{n}\right\}$ is a sequence of closed nonempty and bounded sets in a complete metric space $X$, if $E_{n} \supset E_{n+1}$, and if $\lim _{n \rightarrow \infty} \operatorname{diam} E_{n}=0,$ then $\bigcap_{1}^{\infty} E_{n}$ consists of exactly one point.-/


```lean
theorem exercise_3_21
  {X : Type*} [MetricSpace X] [CompleteSpace X]
  (E : ℕ → Set X)
  (hE : ∀ n, E n ⊃ E (n + 1))
  (hE' : Tendsto (λ n => Metric.diam (E n)) atTop (𝓝 0)) :
  ∃ a, Set.iInter E = {a} :=
```

## Statement 49
/-- Suppose $X$ is a nonempty complete metric space, and $\left\{G_{n}\right\}$ is a sequence of dense open sets of $X$. Prove Baire's theorem, namely, that $\bigcap_{1}^{\infty} G_{n}$ is not empty.-/


```lean
theorem exercise_3_22 (X : Type*) [MetricSpace X] [CompleteSpace X]
  (G : ℕ → Set X) (hG : ∀ n, IsOpen (G n) ∧ Dense (G n)) :
  ∃ x, ∀ n, x ∈ G n :=
```

## Statement 50
/-- Suppose $f$ is a real function defined on $\mathbb{R}$ which satisfies $\lim_{h \rightarrow 0} f(x + h) - f(x - h) = 0$ for every $x \in \mathbb{R}$. Show that $f$ does not need to be continuous.-/


```lean
theorem exercise_4_1a
  : ∃ (f : ℝ → ℝ), (∀ (x : ℝ), Tendsto (λ y => f (x + y) - f (x - y)) (𝓝 0) (𝓝 0)) ∧ ¬ Continuous f :=
```

## Statement 51
/-- If $f$ is a continuous mapping of a metric space $X$ into a metric space $Y$, prove that $f(\overline{E}) \subset \overline{f(E)}$ for every set $E \subset X$. ($\overline{E}$ denotes the closure of $E$).-/


```lean
theorem exercise_4_2a
  {α : Type} [MetricSpace α]
  {β : Type} [MetricSpace β]
  (f : α → β)
  (h₁ : Continuous f)
  : ∀ (x : Set α), f '' (closure x) ⊆ closure (f '' x) :=
```

## Statement 52
/-- Let $f$ be a continuous real function on a metric space $X$. Let $Z(f)$ (the zero set of $f$ ) be the set of all $p \in X$ at which $f(p)=0$. Prove that $Z(f)$ is closed.-/


```lean
theorem exercise_4_3
  {α : Type} [MetricSpace α]
  (f : α → ℝ) (h : Continuous f) (z : Set α) (g : z = f⁻¹' {0})
  : IsClosed z :=
```

## Statement 53
/-- Let $f$ and $g$ be continuous mappings of a metric space $X$ into a metric space $Y$, and let $E$ be a dense subset of $X$. Prove that $f(E)$ is dense in $f(X)$.-/


```lean
theorem exercise_4_4a
  {α : Type} [MetricSpace α]
  {β : Type} [MetricSpace β]
  (f : α → β)
  (s : Set α)
  (h₁ : Continuous f)
  (h₂ : Dense s)
  : f '' Set.univ ⊆ closure (f '' s) :=
```

## Statement 54
/-- Let $f$ and $g$ be continuous mappings of a metric space $X$ into a metric space $Y$, and let $E$ be a dense subset of $X$. Prove that if $g(p) = f(p)$ for all $p \in P$ then $g(p) = f(p)$ for all $p \in X$.-/


```lean
theorem exercise_4_4b
  {α : Type} [MetricSpace α]
  {β : Type} [MetricSpace β]
  (f g : α → β)
  (s : Set α)
  (h₁ : Continuous f)
  (h₂ : Continuous g)
  (h₃ : Dense s)
  (h₄ : ∀ x ∈ s, f x = g x)
  : f = g :=
```

## Statement 55
/-- If $f$ is a real continuous function defined on a closed set $E \subset \mathbb{R}$, prove that there exist continuous real functions $g$ on $\mathbb{R}$ such that $g(x)=f(x)$ for all $x \in E$.-/


```lean
theorem exercise_4_5a
  (f : ℝ → ℝ)
  (E : Set ℝ)
  (h₁ : IsClosed E)
  (h₂ : ContinuousOn f E)
  : ∃ (g : ℝ → ℝ), Continuous g ∧ ∀ x ∈ E, f x = g x :=
```

## Statement 56
/-- Show that there exist a set $E \subset \mathbb{R}$ and a real continuous function $f$ defined on $E$, such that there does not exist a continuous real function $g$ on $\mathbb{R}$ such that $g(x)=f(x)$ for all $x \in E$.-/


```lean
theorem exercise_4_5b
  : ∃ (E : Set ℝ) (f : ℝ → ℝ), (ContinuousOn f E) ∧
  (¬ ∃ (g : ℝ → ℝ), Continuous g ∧ ∀ x ∈ E, f x = g x) :=
```

## Statement 57
/-- If $f$ is defined on $E$, the graph of $f$ is the set of points $(x, f(x))$, for $x \in E$. In particular, if $E$ is a set of real numbers, and $f$ is real-valued, the graph of $f$ is a subset of the plane. Suppose $E$ is compact, and prove that $f$ is continuous on $E$ if and only if its graph is compact.-/


```lean
theorem exercise_4_6
  (f : ℝ → ℝ)
  (E : Set ℝ)
  (G : Set (ℝ × ℝ))
  (h₁ : IsCompact E)
  (h₂ : G = {(x, f x) | x ∈ E})
  : ContinuousOn f E ↔ IsCompact G :=
```

## Statement 58
/-- Let $f$ be a real uniformly continuous function on the bounded set $E$ in $R^{1}$. Prove that $f$ is bounded on $E$.-/


```lean
theorem exercise_4_8a
  (E : Set ℝ) (f : ℝ → ℝ) (hf : UniformContinuousOn f E)
  (hE : Bornology.IsBounded E) : Bornology.IsBounded (Set.image f E) :=
```

## Statement 59
/-- Let $E$ be a bounded set in $R^{1}$. Prove that there exists a real function $f$ such that $f$ is uniformly continuous and is not bounded on $E$.-/


```lean
theorem exercise_4_8b
  (E : Set ℝ) :
  ∃ f : ℝ → ℝ, UniformContinuousOn f E ∧ ¬ Bornology.IsBounded (Set.image f E) :=
```

## Statement 60
/-- Suppose $f$ is a uniformly continuous mapping of a metric space $X$ into a metric space $Y$ and prove that $\left\{f\left(x_{n}\right)\right\}$ is a Cauchy sequence in $Y$ for every Cauchy sequence $\{x_n\}$ in $X$.-/


```lean
theorem exercise_4_11a
  {X : Type*} [MetricSpace X]
  {Y : Type*} [MetricSpace Y]
  (f : X → Y) (hf : UniformContinuous f)
  (x : ℕ → X) (hx : CauchySeq x) :
  CauchySeq (λ n => f (x n)) :=
```

## Statement 61
/-- A uniformly continuous function of a uniformly continuous function is uniformly continuous.-/


```lean
theorem exercise_4_12
  {α β γ : Type*} [UniformSpace α] [UniformSpace β] [UniformSpace γ]
  {f : α → β} {g : β → γ}
  (hf : UniformContinuous f) (hg : UniformContinuous g) :
  UniformContinuous (g ∘ f) :=
```

## Statement 62
/-- Prove that every continuous open mapping of $R^{1}$ into $R^{1}$ is monotonic.-/


```lean
theorem exercise_4_15 {f : ℝ → ℝ}
  (hf : Continuous f) (hof : IsOpenMap f) :
  Monotone f :=
```

## Statement 63
/-- Suppose $f$ is a real function with domain $R^{1}$ which has the intermediate value property: if $f(a)<c<f(b)$, then $f(x)=c$ for some $x$ between $a$ and $b$. Suppose also, for every rational $r$, that the set of all $x$ with $f(x)=r$ is closed. Prove that $f$ is continuous.-/


```lean
theorem exercise_4_19
  {f : ℝ → ℝ} (hf : ∀ a b c, a < b → f a < c → c < f b → ∃ x, a < x ∧ x < b ∧ f x = c)
  (hg : ∀ r : ℚ, IsClosed {x | f x = r}) : Continuous f :=
```

## Statement 64
/-- Suppose $K$ and $F$ are disjoint sets in a metric space $X, K$ is compact, $F$ is closed. Prove that there exists $\delta>0$ such that $d(p, q)>\delta$ if $p \in K, q \in F$.-/


```lean
theorem exercise_4_21a {X : Type*} [MetricSpace X]
  (K F : Set X) (hK : IsCompact K) (hF : IsClosed F) (hKF : Disjoint K F) :
  ∃ (δ : ℝ), δ > 0 ∧ ∀ (p q : X), p ∈ K → q ∈ F → dist p q ≥ δ :=
```

## Statement 65
/-- Assume that $f$ is a continuous real function defined in $(a, b)$ such that $f\left(\frac{x+y}{2}\right) \leq \frac{f(x)+f(y)}{2}$ for all $x, y \in(a, b)$. Prove that $f$ is convex.-/


```lean
theorem exercise_4_24 {f : ℝ → ℝ}
  (hf : Continuous f) (a b : ℝ) (hab : a < b)
  (h : ∀ x y : ℝ, a < x → x < b → a < y → y < b → f ((x + y) / 2) ≤ (f x + f y) / 2) :
  ConvexOn ℝ (Set.Ioo a b) f :=
```

## Statement 66
/-- Let $f$ be defined for all real $x$, and suppose that $|f(x)-f(y)| \leq (x-y)^{2}$ for all real $x$ and $y$. Prove that $f$ is constant.-/


```lean
theorem exercise_5_1
  {f : ℝ → ℝ} (hf : ∀ x y : ℝ, |(f x - f y)| ≤ (x - y) ^ 2) :
  ∃ c, f = λ x => c :=
```

## Statement 67
/-- Suppose $f^{\prime}(x)>0$ in $(a, b)$. Prove that $f$ is strictly increasing in $(a, b)$, and let $g$ be its inverse function. Prove that $g$ is differentiable, and that $g^{\prime}(f(x))=\frac{1}{f^{\prime}(x)} \quad(a<x<b)$.-/


```lean
theorem exercise_5_2 {a b : ℝ}
  {f g : ℝ → ℝ} (hf : ∀ x ∈ Set.Ioo a b, deriv f x > 0)
  (hg : g = f⁻¹)
  (hg_diff : DifferentiableOn ℝ g (Set.Ioo a b)) :
  DifferentiableOn ℝ g (Set.Ioo a b) ∧
  ∀ x ∈ Set.Ioo a b, deriv g x = 1 / deriv f x :=
```

## Statement 68
/-- Suppose $g$ is a real function on $R^{1}$, with bounded derivative (say $\left|g^{\prime}\right| \leq M$ ). Fix $\varepsilon>0$, and define $f(x)=x+\varepsilon g(x)$. Prove that $f$ is one-to-one if $\varepsilon$ is small enough.-/


```lean
theorem exercise_5_3 {g : ℝ → ℝ} (hg : Continuous g)
  (hg' : ∃ M : ℝ, ∀ x : ℝ, |deriv g x| ≤ M) :
  ∃ N, ∀ ε > 0, ε < N → Function.Injective (λ x : ℝ => x + ε * g x) :=
```

## Statement 69
/-- If $C_{0}+\frac{C_{1}}{2}+\cdots+\frac{C_{n-1}}{n}+\frac{C_{n}}{n+1}=0,$ where $C_{0}, \ldots, C_{n}$ are real constants, prove that the equation $C_{0}+C_{1} x+\cdots+C_{n-1} x^{n-1}+C_{n} x^{n}=0$ has at least one real root between 0 and 1.-/


```lean
theorem exercise_5_4 {n : ℕ}
  (C : ℕ → ℝ)
  (hC : ∑ i in (range (n + 1)), (C i) / (i + 1) = 0) :
  ∃ x, x ∈ (Set.Icc (0 : ℝ) 1) ∧ ∑ i in range (n + 1), (C i) * (x^i) = 0 :=
```

## Statement 70
/-- Suppose $f$ is defined and differentiable for every $x>0$, and $f^{\prime}(x) \rightarrow 0$ as $x \rightarrow+\infty$. Put $g(x)=f(x+1)-f(x)$. Prove that $g(x) \rightarrow 0$ as $x \rightarrow+\infty$.-/


```lean
theorem exercise_5_5
  {f : ℝ → ℝ}
  (hfd : Differentiable ℝ f)
  (hf : Tendsto (deriv f) atTop (𝓝 0)) :
  Tendsto (λ x => f (x + 1) - f x) atTop atTop :=
```

## Statement 71
/-- Suppose (a) $f$ is continuous for $x \geq 0$, (b) $f^{\prime}(x)$ exists for $x>0$, (c) $f(0)=0$, (d) $f^{\prime}$ is monotonically increasing. Put $g(x)=\frac{f(x)}{x} \quad(x>0)$ and prove that $g$ is monotonically increasing.-/


```lean
theorem exercise_5_6
  {f : ℝ → ℝ}
  (hf1 : Continuous f)
  (hf2 : ∀ x, DifferentiableAt ℝ f x)
  (hf3 : f 0 = 0)
  (hf4 : Monotone (deriv f)) :
  MonotoneOn (λ x => f x / x) (Set.Ioi 0) :=
```

## Statement 72
/-- Suppose $f^{\prime}(x), g^{\prime}(x)$ exist, $g^{\prime}(x) \neq 0$, and $f(x)=g(x)=0$. Prove that $\lim _{t \rightarrow x} \frac{f(t)}{g(t)}=\frac{f^{\prime}(x)}{g^{\prime}(x)}.$-/


```lean
theorem exercise_5_7
  {f g : ℝ → ℝ} {x : ℝ}
  (hf' : DifferentiableAt ℝ f 0)
  (hg' : DifferentiableAt ℝ g 0)
  (hg'_ne_0 : deriv g 0 ≠ 0)
  (f0 : f 0 = 0) (g0 : g 0 = 0) :
  Tendsto (λ x => f x / g x) (𝓝 x) (𝓝 (deriv f x / deriv g x)) :=
```

## Statement 73
/-- Suppose $a \in R^{1}, f$ is a twice-differentiable real function on $(a, \infty)$, and $M_{0}, M_{1}, M_{2}$ are the least upper bounds of $|f(x)|,\left|f^{\prime}(x)\right|,\left|f^{\prime \prime}(x)\right|$, respectively, on $(a, \infty)$. Prove that $M_{1}^{2} \leq 4 M_{0} M_{2} .$-/


```lean
theorem exercise_5_15 {f : ℝ → ℝ} (a M0 M1 M2 : ℝ)
  (hf' : DifferentiableOn ℝ f (Set.Ici a))
  (hf'' : DifferentiableOn ℝ (deriv f) (Set.Ici a))
  (hM0 : M0 = sSup {(|f x|) | x ∈ (Set.Ici a)})
  (hM1 : M1 = sSup {(|deriv f x|) | x ∈ (Set.Ici a)})
  (hM2 : M2 = sSup {(|deriv (deriv f) x|) | x ∈ (Set.Ici a)}) :
  (M1 ^ 2) ≤ 4 * M0 * M2 :=
```

## Statement 74
/-- Suppose $f$ is a real, three times differentiable function on $[-1,1]$, such that $f(-1)=0, \quad f(0)=0, \quad f(1)=1, \quad f^{\prime}(0)=0 .$ Prove that $f^{(3)}(x) \geq 3$ for some $x \in(-1,1)$.-/


```lean
theorem exercise_5_17
  {f : ℝ → ℝ}
  (hf' : DifferentiableOn ℝ f (Set.Icc (-1) 1))
  (hf'' : DifferentiableOn ℝ (deriv f) (Set.Icc 1 1))
  (hf''' : DifferentiableOn ℝ (deriv (deriv f)) (Set.Icc 1 1))
  (hf0 : f (-1) = 0)
  (hf1 : f 0 = 0)
  (hf2 : f 1 = 1)
  (hf3 : deriv f 0 = 0) :
  ∃ x, x ∈ Set.Ioo (-1 : ℝ) 1 ∧ deriv (deriv (deriv f)) x ≥ 3 :=
```

## Statement 75
/-- If $G$ is a finite group of even order, show that there must be an element $a \neq e$ such that $a=a^{-1}$.-/


```lean
theorem exercise_2_1_18 {G : Type*} [Group G]
  [Fintype G] (hG2 : Even (card G)) :
  ∃ (a : G), a ≠ 1 ∧ a = a⁻¹ :=
```

## Statement 76
/-- Show that a group of order 5 must be abelian.-/


```lean
def exercise_2_1_21 (G : Type*) [Group G] [Fintype G]
  (hG : card G = 5) :
  CommGroup G :=
```

## Statement 77
/-- If $G$ is a finite group, prove that, given $a \in G$, there is a positive integer $n$, depending on $a$, such that $a^n = e$.-/


```lean
theorem exercise_2_1_26 {G : Type*} [Group G]
  [Fintype G] (a : G) : ∃ (n : ℕ), a ^ n = 1 :=
```

## Statement 78
/-- If $G$ is a finite group, prove that there is an integer $m > 0$ such that $a^m = e$ for all $a \in G$.-/


```lean
theorem exercise_2_1_27 {G : Type*} [Group G]
  [Fintype G] : ∃ (m : ℕ), ∀ (a : G), a ^ m = 1 :=
```

## Statement 79
/-- If $G$ is a group in which $(a b)^{i}=a^{i} b^{i}$ for three consecutive integers $i$, prove that $G$ is abelian.-/


```lean
def exercise_2_2_3 {G : Type*} [Group G]
  {P : ℕ → Prop} {hP : P = λ i => ∀ a b : G, (a*b)^i = a^i * b^i}
  (hP1 : ∃ n : ℕ, P n ∧ P (n+1) ∧ P (n+2)) : CommGroup G :=
```

## Statement 80
/-- Let $G$ be a group in which $(a b)^{3}=a^{3} b^{3}$ and $(a b)^{5}=a^{5} b^{5}$ for all $a, b \in G$. Show that $G$ is abelian.-/


```lean
def exercise_2_2_5 {G : Type*} [Group G]
  (h : ∀ (a b : G), (a * b) ^ 3 = a ^ 3 * b ^ 3 ∧ (a * b) ^ 5 = a ^ 5 * b ^ 5) :
  CommGroup G :=
```

## Statement 81
/-- Let $G$ be a group in which $(a b)^{n}=a^{n} b^{n}$ for some fixed integer $n>1$ for all $a, b \in G$. For all $a, b \in G$, prove that $\left(a b a^{-1} b^{-1}\right)^{n(n-1)}=e$.-/


```lean
theorem exercise_2_2_6c {G : Type*} [Group G] {n : ℕ} (hn : n > 1)
  (h : ∀ (a b : G), (a * b) ^ n = a ^ n * b ^ n) :
  ∀ (a b : G), (a * b * a⁻¹ * b⁻¹) ^ (n * (n - 1)) = 1 :=
```

## Statement 82
/-- If $G$ is a group and $a, x \in G$, prove that $C\left(x^{-1} a x\right)=x^{-1} C(a) x$-/


```lean
theorem exercise_2_3_17 {G : Type*} [Mul G] [Group G] (a x : G) :
  centralizer {x⁻¹*a*x} =
  (λ g : G => x⁻¹*g*x) '' (centralizer {a}) :=
```

## Statement 83
/-- If a group $G$ has no proper subgroups, prove that $G$ is cyclic of order $p$, where $p$ is a prime number.-/


```lean
theorem exercise_2_3_16 {G : Type*} [Group G]
  (hG : ∀ H : Subgroup G, H = ⊤ ∨ H = ⊥) :
  IsCyclic G ∧ ∃ (p : ℕ) (Fin : Fintype G), Nat.Prime p ∧ @card G Fin = p :=
```

## Statement 84
/-- If $a > 1$ is an integer, show that $n \mid \varphi(a^n - 1)$, where $\phi$ is the Euler $\varphi$-function.-/


```lean
theorem exercise_2_4_36 {a n : ℕ} (h : a > 1) :
  n ∣ (a ^ n - 1).totient :=
```

## Statement 85
/-- Let $G$ be a group such that all subgroups of $G$ are normal in $G$. If $a, b \in G$, prove that $ba = a^jb$ for some $j$.-/


```lean
theorem exercise_2_5_23 {G : Type*} [Group G]
  (hG : ∀ (H : Subgroup G), H.Normal) (a b : G) :
  ∃ (j : ℤ) , b*a = a^j * b :=
```

## Statement 86
/-- Suppose that $|G| = pm$, where $p \nmid m$ and $p$ is a prime. If $H$ is a normal subgroup of order $p$ in $G$, prove that $H$ is characteristic.-/


```lean
theorem exercise_2_5_30 {G : Type*} [Group G] [Fintype G]
  {p m : ℕ} (hp : Nat.Prime p) (hp1 : ¬ p ∣ m) (hG : card G = p*m)
  {H : Subgroup G} [Fintype H] [H.Normal] (hH : card H = p):
  Subgroup.Characteristic H :=
```

## Statement 87
/-- Suppose that $G$ is an abelian group of order $p^nm$ where $p \nmid m$ is a prime.  If $H$ is a subgroup of $G$ of order $p^n$, prove that $H$ is a characteristic subgroup of $G$.-/


```lean
theorem exercise_2_5_31 {G : Type*} [CommGroup G] [Fintype G]
  {p m n : ℕ} (hp : Nat.Prime p) (hp1 : ¬ p ∣ m) (hG : card G = p^n*m)
  {H : Subgroup G} [Fintype H] (hH : card H = p^n) :
  Subgroup.Characteristic H :=
```

## Statement 88
/-- If $G$ is a nonabelian group of order 6, prove that $G \simeq S_3$.-/


```lean
def exercise_2_5_37 (G : Type*) [Group G] [Fintype G]
  (hG : card G = 6) (hG' : IsEmpty (CommGroup G)) :
  G ≃* Equiv.Perm (Fin 3) :=
```

## Statement 89
/-- Prove that a group of order 9 must be abelian.-/


```lean
def exercise_2_5_43 (G : Type*) [Group G] [Fintype G]
  (hG : card G = 9) :
  CommGroup G :=
```

## Statement 90
/-- Prove that a group of order $p^2$, $p$ a prime, has a normal subgroup of order $p$.-/


```lean
theorem exercise_2_5_44 {G : Type*} [Group G] [Fintype G] {p : ℕ}
  (hp : Nat.Prime p) (hG : card G = p^2) :
  ∃ (N : Subgroup G) (Fin : Fintype N), @card N Fin = p ∧ N.Normal :=
```

## Statement 91
/-- Let $G$ be a finite group and $\varphi$ an automorphism of $G$ such that $\varphi(x) = x^{-1}$ for more than three-fourths of the elements of $G$. Prove that $\varphi(y) = y^{-1}$ for all $y \in G$, and so $G$ is abelian.-/


```lean
theorem exercise_2_5_52 {G : Type*} [Group G] [Fintype G]
  (φ : G ≃* G) {I : Finset G} (hI : ∀ x ∈ I, φ x = x⁻¹)
  (hI1 : (0.75 : ℚ) * card G ≤ card I) :
  ∀ x : G, φ x = x⁻¹ ∧ ∀ x y : G, x*y = y*x :=
```

## Statement 92
/-- If $G$ is an abelian group and if $G$ has an element of order $m$ and one of order $n$, where $m$ and $n$ are relatively prime, prove that $G$ has an element of order $mn$.-/


```lean
theorem exercise_2_6_15 {G : Type*} [CommGroup G] {m n : ℕ}
  (hm : ∃ (g : G), orderOf g = m)
  (hn : ∃ (g : G), orderOf g = n)
  (hmn : m.Coprime n) :
  ∃ (g : G), orderOf g = m * n :=
```

## Statement 93
/-- If $\varphi$ is a homomorphism of $G$ onto $G'$ and $N \triangleleft G$, show that $\varphi(N) \triangleleft G'$.-/


```lean
theorem exercise_2_7_7 {G : Type*} [Group G] {G' : Type*} [Group G']
  (φ : G →* G') (N : Subgroup G) [N.Normal] :
  (Subgroup.map φ N).Normal :=
```

## Statement 94
/-- Prove that any two nonabelian groups of order 21 are isomorphic.-/


```lean
def exercise_2_8_12 {G H : Type*} [Fintype G] [Fintype H]
  [Group G] [Group H] (hG : card G = 21) (hH : card H = 21)
  (hG1 : IsEmpty (CommGroup G)) (hH1 : IsEmpty (CommGroup H)) :
  G ≃* H :=
```

## Statement 95
/-- Prove that if $p > q$ are two primes such that $q \mid p - 1$, then any two nonabelian groups of order $pq$ are isomorphic.-/


```lean
def exercise_2_8_15 {G H: Type*} [Fintype G] [Group G] [Fintype H]
  [Group H] {p q : ℕ} (hp : Nat.Prime p) (hq : Nat.Prime q)
  (h : p > q) (h1 : q ∣ p - 1) (hG : card G = p*q) (hH : card G = p*q) :
  G ≃* H :=
```

## Statement 96
/-- If $G_1$ and $G_2$ are cyclic groups of orders $m$ and $n$, respectively, prove that $G_1 \times G_2$ is cyclic if and only if $m$ and $n$ are relatively prime.-/


```lean
theorem exercise_2_9_2 {G H : Type*} [Fintype G] [Fintype H] [Group G]
  [Group H] (hG : IsCyclic G) (hH : IsCyclic H) :
  IsCyclic (G × H) ↔ (card G).Coprime (card H) :=
```

## Statement 97
/-- Let $A$ be a normal subgroup of a group $G$, and suppose that $b \in G$ is an element of prime order $p$, and that $b \not\in A$. Show that $A \cap (b) = (e)$.-/


```lean
theorem exercise_2_10_1 {G : Type*} [Group G] (A : Subgroup G)
  [A.Normal] {b : G} (hp : Nat.Prime (orderOf b)) :
  A ⊓ (Subgroup.closure {b}) = ⊥ :=
```

## Statement 98
/-- If $P$ is a $p$-Sylow subgroup of $G$ and $P \triangleleft G$, prove that $P$ is the only $p$-Sylow subgroup of $G$.-/


```lean
theorem exercise_2_11_6 {G : Type*} [Group G] {p : ℕ} (hp : Nat.Prime p)
  {P : Sylow p G} (hP : P.Normal) :
  ∀ (Q : Sylow p G), P = Q :=
```

## Statement 99
/-- If $P \triangleleft G$, $P$ a $p$-Sylow subgroup of $G$, prove that $\varphi(P) = P$ for every automorphism $\varphi$ of $G$.-/


```lean
theorem exercise_2_11_7 {G : Type*} [Group G] {p : ℕ} (hp : Nat.Prime p)
  {P : Sylow p G} (hP : P.Normal) :
  Subgroup.Characteristic (P : Subgroup G) :=
```

## Statement 100
/-- Show that any subgroup of order $p^{n-1}$ in a group $G$ of order $p^n$ is normal in $G$.-/


```lean
theorem exercise_2_11_22 {p : ℕ} {n : ℕ} {G : Type*} [Fintype G]
  [Group G] (hp : Nat.Prime p) (hG : card G = p ^ n) {K : Subgroup G}
  [Fintype K] (hK : card K = p ^ (n-1)) :
  K.Normal :=
```

## Statement 101
/-- If $\sigma, \tau$ are two permutations that disturb no common element and $\sigma \tau = e$, prove that $\sigma = \tau = e$.-/


```lean
theorem exercise_3_2_21 {α : Type*} [Fintype α] {σ τ: Equiv.Perm α}
  (h1 : ∀ a : α, σ a = a ↔ τ a ≠ a) (h2 : τ ∘ σ = id) :
  σ = 1 ∧ τ = 1 :=
```

## Statement 102
/-- Show that there is an infinite number of solutions to $x^2 = -1$ in the quaternions.-/


```lean
theorem exercise_4_1_19 : Infinite {x : Quaternion ℝ | x^2 = -1} :=
```

## Statement 103
/-- Let $T$ be the group of $2\times 2$ matrices $A$ with entries in the field $\mathbb{Z}_2$ such that $\det A$ is not equal to 0. Prove that $T$ is isomorphic to $S_3$, the symmetric group of degree 3.-/


```lean
def exercise_4_1_34 : Equiv.Perm (Fin 3) ≃* Matrix.GeneralLinearGroup (Fin 2) (ZMod 2) :=
```

## Statement 104
/-- Let $R$ be a ring in which $x^3 = x$ for every $x \in R$. Prove that $R$ is commutative.-/


```lean
def exercise_4_2_5 {R : Type*} [Ring R]
  (h : ∀ x : R, x ^ 3 = x) : CommRing R :=
```

## Statement 105
/-- If $a^2 = 0$ in $R$, show that $ax + xa$ commutes with $a$.-/


```lean
theorem exercise_4_2_6 {R : Type*} [Ring R] (a x : R)
  (h : a ^ 2 = 0) : a * (a * x + x * a) = (x + x * a) * a :=
```

## Statement 106
/-- Let $p$ be an odd prime and let $1 + \frac{1}{2} + ... + \frac{1}{p - 1} = \frac{a}{b}$, where $a, b$ are integers. Show that $p \mid a$.-/


```lean
theorem exercise_4_2_9 {p : ℕ} (hp : Nat.Prime p) (hp1 : Odd p) :
  ∃ (a b : ℤ), (a / b : ℚ) = ∑ i in Finset.range p, 1 / (i + 1) → ↑p ∣ a :=
```

## Statement 107
/-- If $R$ is a commutative ring and $a \in R$, let $L(a) = \{x \in R \mid xa = 0\}$. Prove that $L(a)$ is an ideal of $R$.-/


```lean
theorem exercise_4_3_1 {R : Type*} [CommRing R] (a : R) :
  ∃ I : Ideal R, {x : R | x*a=0} = I :=
```

## Statement 108
/-- Let $R$ be the ring of $2 \times 2$ matrices over the real numbers; suppose that $I$ is an ideal of $R$. Show that $I = (0)$ or $I = R$.-/


```lean
theorem exercise_4_3_25 (I : Ideal (Matrix (Fin 2) (Fin 2) ℝ)) :
  I = ⊥ ∨ I = ⊤ :=
```

## Statement 109
/-- Show that $(p - 1)/2$ of the numbers $1, 2, \ldots, p - 1$ are quadratic residues and $(p - 1)/2$ are quadratic nonresidues $\mod p$.-/


```lean
theorem exercise_4_4_9 (p : ℕ) (hp : Nat.Prime p) :
  (∃ S : Finset (ZMod p), S.card = (p-1)/2 ∧ ∃ x : ZMod p, x^2 = p) ∧
  (∃ S : Finset (ZMod p), S.card = (p-1)/2 ∧ ¬ ∃ x : ZMod p, x^2 = p) :=
```

## Statement 110
/-- Let $F = \mathbb{Z}_p$ be the field of integers $\mod p$, where $p$ is a prime, and let $q(x) \in F[x]$ be irreducible of degree $n$. Show that $F[x]/(q(x))$ is a field having at exactly $p^n$ elements.-/


```lean
theorem exercise_4_5_16 {p n: ℕ} (hp : Nat.Prime p)
  {q : Polynomial (ZMod p)} (hq : Irreducible q) (hn : q.degree = n) :
  ∃ is_fin : Fintype $ Polynomial (ZMod p) ⧸ span ({q} : Set (Polynomial $ ZMod p)),
  @card (Polynomial (ZMod p) ⧸ span {q}) is_fin = p ^ n ∧
  IsField (Polynomial $ ZMod p) :=
```

## Statement 111
/-- Let $F = \mathbb{Z}_7$ and let $p(x) = x^3 - 2$ and $q(x) = x^3 + 2$ be in $F[x]$. Show that $p(x)$ and $q(x)$ are irreducible in $F[x]$ and that the fields $F[x]/(p(x))$ and $F[x]/(q(x))$ are isomorphic.-/


```lean
theorem exercise_4_5_23 {p q: Polynomial (ZMod 7)}
  (hp : p = X^3 - 2) (hq : q = X^3 + 2) :
  Irreducible p ∧ Irreducible q ∧
  (Nonempty $ Polynomial (ZMod 7) ⧸ span ({p} : Set $ Polynomial $ ZMod 7) ≃+*
  Polynomial (ZMod 7) ⧸ span ({q} : Set $ Polynomial $ ZMod 7)) :=
```

## Statement 112
/-- If $p$ is a prime, show that $q(x) = 1 + x + x^2 + \cdots x^{p - 1}$ is irreducible in $Q[x]$.-/


```lean
theorem exercise_4_5_25 {p : ℕ} (hp : Nat.Prime p) :
  Irreducible (∑ i : Finset.range p, X ^ p : Polynomial ℚ) :=
```

## Statement 113
/-- Prove that $f(x) = x^3 + 3x + 2$ is irreducible in $Q[x]$.-/


```lean
theorem exercise_4_6_2 : Irreducible (X^3 + 3*X + 2 : Polynomial ℚ) :=
```

## Statement 114
/-- Show that there is an infinite number of integers a such that $f(x) = x^7 + 15x^2 - 30x + a$ is irreducible in $Q[x]$.-/


```lean
theorem exercise_4_6_3 :
  Infinite {a : ℤ | Irreducible (X^7 + 15*X^2 - 30*X + (a : Polynomial ℚ) : Polynomial ℚ)} :=
```

## Statement 115
/-- If $F$ is a field of characteristic $p \neq 0$, show that $(a + b)^m = a^m + b^m$, where $m = p^n$, for all $a, b \in F$ and any positive integer $n$.-/


```lean
theorem exercise_5_1_8 {p m n: ℕ} {F : Type*} [Field F]
  (hp : Nat.Prime p) (hF : CharP F p) (a b : F) (hm : m = p ^ n) :
  (a + b) ^ m = a^m + b^m :=
```

## Statement 116
/-- Let $V$ be a vector space over an infinite field $F$. Show that $V$ cannot be the set-theoretic union of a finite number of proper subspaces of $V$.-/


```lean
theorem exercise_5_2_20 {F V ι: Type*} [Infinite F] [Field F]
  [AddCommGroup V] [Module F V] {u : ι → Submodule F V}
  (hu : ∀ i : ι, u i ≠ ⊤) :
  (⋃ i : ι, (u i : Set V)) ≠ ⊤ :=
```

## Statement 117
/-- If $a \in K$ is such that $a^2$ is algebraic over the subfield $F$ of $K$, show that a is algebraic over $F$.-/


```lean
theorem exercise_5_3_7 {K : Type*} [Field K] {F : Subfield K}
  {a : K} (ha : IsAlgebraic F (a ^ 2)) : IsAlgebraic F a :=
```

## Statement 118
/-- Prove that $\cos 1^{\circ}$  is algebraic over $\mathbb{Q}$.-/


```lean
theorem exercise_5_3_10 : IsAlgebraic ℚ (cos (Real.pi / 180)) :=
```

## Statement 119
/-- If $a \in C$ is such that $p(a) = 0$, where $p(x) = x^5 + \sqrt{2}x^3 + \sqrt{5}x^2 + \sqrt{7}x + \sqrt{11}$, show that $a$ is algebraic over $\mathbb{Q}$ of degree at most 80.-/


```lean
theorem exercise_5_4_3 {a : ℂ} {p : ℂ → ℂ}
  (hp : p = λ (x : ℂ) => x^5 + sqrt 2 * x^3 + sqrt 5 * x^2 + sqrt 7 * x + 11)
  (ha : p a = 0) :
  ∃ p : Polynomial ℂ , p.degree < 80 ∧ a ∈ p.roots ∧
  ∀ n : p.support, ∃ a b : ℤ, p.coeff n = a / b :=
```

## Statement 120
/-- Prove that $x^3 - 3x - 1$ is irreducible over $\mathbb{Q}$.-/


```lean
theorem exercise_5_5_2 : Irreducible (X^3 - 3*X - 1 : Polynomial ℚ) :=
```

## Statement 121
/-- If $F$ is of characteristic $p \neq 0$, show that all the roots of $x^m - x$, where $m = p^n$, are distinct.-/


```lean
theorem exercise_5_6_14 {p m n: ℕ} (hp : Nat.Prime p) {F : Type*}
  [Field F] [CharP F p] (hm : m = p ^ n) :
  card (rootSet (X ^ m - X : Polynomial F) F) = m :=
```

## Statement 122
/-- Let $(p_n)$ be a sequence and $f:\mathbb{N}\to\mathbb{N}$. The sequence $(q_k)_{k\in\mathbb{N}}$ with $q_k=p_{f(k)}$ is called a rearrangement of $(p_n)$. Show that if $f$ is an injection, the limit of a sequence is unaffected by rearrangement.-/


```lean
theorem exercise_2_12a (f : ℕ → ℕ) (p : ℕ → ℝ) (a : ℝ)
  (hf : Injective f) (hp : Tendsto p atTop (𝓝 a)) :
  Tendsto (λ n => p (f n)) atTop (𝓝 a) :=
```

## Statement 123
/-- Prove that a set $U \subset M$ is open if and only if none of its points are limits of its complement.-/


```lean
theorem exercise_2_26 {M : Type*} [TopologicalSpace M]
  (U : Set M) : IsOpen U ↔ ∀ x ∈ U, ¬ ClusterPt x (𝓟 Uᶜ) :=
```

## Statement 124
/-- Let $\mathcal{T}$ be the collection of open subsets of a metric space $\mathrm{M}$, and $\mathcal{K}$ the collection of closed subsets. Show that there is a bijection from $\mathcal{T}$ onto $\mathcal{K}$.-/


```lean
theorem exercise_2_29 (M : Type*) [MetricSpace M]
  (O C : Set (Set M))
  (hO : O = {s | IsOpen s})
  (hC : C = {s | IsClosed s}) :
  ∃ f : O → C, Bijective f :=
```

## Statement 125
/-- Show that every subset of $\mathbb{N}$ is clopen.-/


```lean
theorem exercise_2_32a (A : Set ℕ) : IsClopen A :=
```

## Statement 126
/-- Let $\|\cdot\|$ be any norm on $\mathbb{R}^{m}$ and let $B=\left\{x \in \mathbb{R}^{m}:\|x\| \leq 1\right\}$. Prove that $B$ is compact.-/


```lean
theorem exercise_2_41 (m : ℕ) {X : Type*} [NormedSpace ℝ ((Fin m) → ℝ)] :
  IsCompact (Metric.closedBall 0 1) :=
```

## Statement 127
/-- Assume that $A, B$ are compact, disjoint, nonempty subsets of $M$. Prove that there are $a_0 \in A$ and $b_0 \in B$ such that for all $a \in A$ and $b \in B$ we have $d(a_0, b_0) \leq d(a, b)$.-/


```lean
theorem exercise_2_46 {M : Type*} [MetricSpace M]
  {A B : Set M} (hA : IsCompact A) (hB : IsCompact B)
  (hAB : Disjoint A B) (hA₀ : A ≠ ∅) (hB₀ : B ≠ ∅) :
  ∃ a₀ b₀, a₀ ∈ A ∧ b₀ ∈ B ∧ ∀ (a : M) (b : M),
  a ∈ A → b ∈ B → dist a₀ b₀ ≤ dist a b :=
```

## Statement 128
/-- Show that if $S$ is connected, it is not true in general that its interior is connected.-/


```lean
theorem exercise_2_57 {X : Type*} [TopologicalSpace X]
  : ∃ (S : Set X), IsConnected S ∧ ¬ IsConnected (interior S) :=
```

## Statement 129
/-- Give a direct proof that the nested decreasing intersection of nonempty covering compact sets is nonempty.-/


```lean
theorem exercise_2_92 {α : Type*} [TopologicalSpace α]
  {s : ℕ → Set α}
  (hs : ∀ i, IsCompact (s i))
  (hs : ∀ i, (s i).Nonempty)
  (hs : ∀ i, (s i) ⊃ (s (i + 1))) :
  (⋂ i, s i).Nonempty :=
```

## Statement 130
/-- Suppose that $E$ is an uncountable subset of $\mathbb{R}$. Prove that there exists a point $p \in \mathbb{R}$ at which $E$ condenses.-/


```lean
theorem exercise_2_126 {E : Set ℝ}
  (hE : ¬ Set.Countable E) : ∃ (p : ℝ), ClusterPt p (𝓟 E) :=
```

## Statement 131
/-- Assume that $f \colon \mathbb{R} \rightarrow \mathbb{R}$ satisfies $|f(t)-f(x)| \leq|t-x|^{2}$ for all $t, x$. Prove that $f$ is constant.-/


```lean
theorem exercise_3_1 {f : ℝ → ℝ}
  (hf : ∀ x y, |f x - f y| ≤ |x - y| ^ 2) :
  ∃ c, f = λ x => c :=
```

## Statement 132
/-- Prove that $\sqrt{n+1}-\sqrt{n} \rightarrow 0$ as $n \rightarrow \infty$.-/


```lean
theorem exercise_3_4 (n : ℕ) :
  Tendsto (λ n => (sqrt (n + 1) - sqrt n)) atTop (𝓝 0) :=
```

## Statement 133
/-- Prove that $\sum 1/k(\log(k))^p$ converges when $p > 1$.-/


```lean
theorem exercise_3_63a (p : ℝ) (f : ℕ → ℝ) (hp : p > 1)
  (h : f = λ (k : ℕ) => (1 : ℝ) / (k * (log k) ^ p)) :
  ∃ l, Tendsto f atTop (𝓝 l) :=
```

## Statement 134
/-- Prove that $\sum 1/k(\log(k))^p$ diverges when $p \leq 1$.-/


```lean
theorem exercise_3_63b (p : ℝ) (f : ℕ → ℝ) (hp : p ≤ 1)
  (h : f = λ (k : ℕ) => (1 : ℝ) / (k * (log k) ^ p)) :
  ¬ ∃ l, Tendsto f atTop (𝓝 l) :=
```

## Statement 135
/-- A continuous, strictly increasing function $\mu \colon (0, \infty) \rightarrow (0, \infty)$ is a modulus of continuity if $\mu(s) \rightarrow 0$ as $s \rightarrow 0$. A function $f \colon [a, b] \rightarrow \mathbb{R}$ has modulus of continuity $\mu$ if $|f(s) - f(t)| \leq \mu(|s - t|)$ for all $s, t \in [a, b]$. Prove that a function is uniformly continuous if and only if it has a modulus of continuity.-/


```lean
theorem exercise_4_15a {α : Type*}
  (a b : ℝ) (F : Set (ℝ → ℝ)) :
  (∀ x : ℝ, ∀ ε > 0, ∃ U ∈ (𝓝 x),
  (∀ y z : U, ∀ f : ℝ → ℝ, f ∈ F → (dist (f y) (f z) < ε)))
  ↔
  ∃ (μ : ℝ → ℝ), ∀ (x : ℝ), (0 : ℝ) ≤ μ x ∧ Tendsto μ (𝓝 0) (𝓝 0) ∧
  (∀ (s t : ℝ) (f : ℝ → ℝ), f ∈ F → |(f s) - (f t)| ≤ μ (|s - t|)) :=
```

## Statement 136
/-- Let $H$ be the subgroup generated by two elements $a, b$ of a group $G$. Prove that if $a b=b a$, then $H$ is an abelian group.-/


```lean
theorem exercise_2_2_9 {G : Type} [Group G] {a b : G} (h : a * b = b * a) :
    ∀ x y : closure {x| x = a ∨ x = b}, x * y = y * x :=
```

## Statement 137
/-- Prove that the products $a b$ and $b a$ are conjugate elements in a group.-/


```lean
theorem exercise_2_3_2 {G : Type*} [Group G] (a b : G) :
    ∃ g : G, b* a = g * a * b * g⁻¹ :=
```

## Statement 138
/-- Prove that if a group contains exactly one element of order 2 , then that element is in the center of the group.-/


```lean
theorem exercise_2_4_19 {G : Type*} [Group G] {x : G}
  (hx : orderOf x = 2) (hx1 : ∀ y, orderOf y = 2 → y = x) :
  x ∈ center G :=
```

## Statement 139
/-- Prove that the center of the product of two groups is the product of their centers.-/


```lean
noncomputable def exercise_2_8_6 {G H : Type*} [Group G] [Group H] :
    center (G × H) ≃* (center G) × (center H) :=
```

## Statement 140
/-- Prove that a group of even order contains an element of order $2 .$-/


```lean
theorem exercise_2_11_3 {G : Type*} [Group G] [Fintype G](hG : Even (card G)) :
  ∃ x : G, orderOf x = 2 :=
```

## Statement 141
/-- Prove that every homomorphism of fields is injective.-/


```lean
theorem exercise_3_2_7 {F : Type*} [Field F] {G : Type*} [Field G]
    (φ : F →+* G) : Injective φ :=
```

## Statement 142
/-- Let $V$ be a vector space which is spanned by a countably infinite set. Prove that every linearly independent subset of $V$ is finite or countably infinite.-/


```lean
theorem exercise_3_5_6 {K V : Type*} [Field K] [AddCommGroup V]
  [Module K V] {S : Set V} (hS : Set.Countable S)
  (hS1 : span K S = ⊤) {ι : Type*} (R : ι → V)
  (hR : LinearIndependent K R) : Countable ι :=
```

## Statement 143
/-- Let $V$ be a vector space over an infinite field $F$. Prove that $V$ is not the union of finitely many proper subspaces.-/


```lean
theorem exercise_3_7_2 {K V : Type*} [Field K] [AddCommGroup V]
  [Module K V] {ι : Type*} [Fintype ι] (γ : ι → Submodule K V)
  (h : ∀ i : ι, γ i ≠ ⊤) :
  (⋂ (i : ι), (γ i : Set V)) ≠ ⊤ :=
```

## Statement 144
/-- Let $Z$ be the center of a group $G$. Prove that if $G / Z$ is a cyclic group, then $G$ is abelian and hence $G=Z$.-/


```lean
theorem exercise_6_1_14 (G : Type*) [Group G]
  (hG : IsCyclic $ G ⧸ (center G)) :
  center G = ⊤ :=
```

## Statement 145
/-- Prove that no group of order $p q$, where $p$ and $q$ are prime, is simple.-/


```lean
theorem exercise_6_4_2 {G : Type*} [Group G] [Fintype G] {p q : ℕ}
  (hp : Prime p) (hq : Prime q) (hG : card G = p*q) :
  IsSimpleGroup G → false :=
```

## Statement 146
/-- Prove that no group of order $p^2 q$, where $p$ and $q$ are prime, is simple.-/


```lean
theorem exercise_6_4_3 {G : Type*} [Group G] [Fintype G] {p q : ℕ}
  (hp : Prime p) (hq : Prime q) (hG : card G = p^2 *q) :
  IsSimpleGroup G → false :=
```

## Statement 147
/-- Prove that no group of order 224 is simple.-/


```lean
theorem exercise_6_4_12 {G : Type*} [Group G] [Fintype G]
  (hG : card G = 224) :
  IsSimpleGroup G → false :=
```

## Statement 148
/-- Prove that two elements $a, b$ of a group generate the same subgroup as $b a b^2, b a b^3$.-/


```lean
theorem exercise_6_8_1 {G : Type*} [Group G]
  (a b : G) : closure ({a, b} : Set G) = Subgroup.closure {b*a*b^2, b*a*b^3} :=
```

## Statement 149
/-- An element $x$ of a ring $R$ is called nilpotent if some power of $x$ is zero. Prove that if $x$ is nilpotent, then $1+x$ is a unit in $R$.-/


```lean
theorem exercise_10_1_13 {R : Type*} [Ring R] {x : R}
  (hx : IsNilpotent x) : IsUnit (1 + x) :=
```

## Statement 150
/-- Prove that in the ring $\mathbb{Z}[x],(2) \cap(x)=(2 x)$.-/


```lean
theorem exercise_10_2_4 :
  span ({2} : Set $ Polynomial ℤ) ⊓ (span {X}) =
  span ({2 * X} : Set $ Polynomial ℤ) :=
```

## Statement 151
/-- Prove that every nonzero ideal in the ring of Gauss integers contains a nonzero integer.-/


```lean
theorem exercise_10_6_7 {I : Ideal GaussianInt}
  (hI : I ≠ ⊥) : ∃ (z : I), z ≠ 0 ∧ (z : GaussianInt).im = 0 :=
```

## Statement 152
/-- Let $I, J$ be ideals in a ring $R$. Prove that the residue of any element of $I \cap J$ in $R / I J$ is nilpotent.-/


```lean
theorem exercise_10_4_6 {R : Type*} [CommRing R]
  [NoZeroDivisors R] (I J : Ideal R) (x : ↑(I ⊓ J)) :
  IsNilpotent ((Ideal.Quotient.mk (I*J)) x) :=
```

## Statement 153
/-- Let $I, J$ be ideals of a ring $R$ such that $I+J=R$. Prove that $I J=I \cap J$.-/


```lean
theorem exercise_10_4_7a {R : Type*} [CommRing R] [NoZeroDivisors R]
  (I J : Ideal R) (hIJ : I + J = ⊤) : I * J = I ⊓ J :=
```

## Statement 154
/-- Let $R$ be a ring, with $M$ an ideal of $R$. Suppose that every element of $R$ which is not in $M$ is a unit of $R$. Prove that $M$ is a maximal ideal and that moreover it is the only maximal ideal of $R$.-/


```lean
theorem exercise_10_7_10 {R : Type*} [Ring R]
  (M : Ideal R) (hM : ∀ (x : R), x ∉ M → IsUnit x)
  (hProper : ∃ x : R, x ∉ M) :
  IsMaximal M ∧ ∀ (N : Ideal R), IsMaximal N → N = M :=
```

## Statement 155
/-- If $a, b$ are integers and if $a$ divides $b$ in the ring of Gauss integers, then $a$ divides $b$ in $\mathbb{Z}$.-/


```lean
theorem exercise_11_2_13 (a b : ℤ) :
  (ofInt a : GaussianInt) ∣ ofInt b → a ∣ b :=
```

## Statement 156
/-- Prove that $x^3 + 6x + 12$ is irreducible in $\mathbb{Q}$.-/


```lean
theorem exercise_11_4_1b {F : Type*} [Field F] [Fintype F] (hF : card F = 2) :
  Irreducible (12 + 6 * X + X ^ 3 : Polynomial F) :=
```

## Statement 157
/-- Prove that $x^2+x+1$ is irreducible in the field $\mathbb{F}_2$.-/


```lean
theorem exercise_11_4_6a {F : Type*} [Field F] [Fintype F] (hF : card F = 7) :
  Irreducible (X ^ 2 + 1 : Polynomial F) :=
```

## Statement 158
/-- Prove that $x^2+1$ is irreducible in $\mathbb{F}_7$-/


```lean
theorem exercise_11_4_6b {F : Type*} [Field F] [Fintype F] (hF : card F = 31) :
  Irreducible (X ^ 3 - 9 : Polynomial F) :=
```

## Statement 159
/-- Prove that $x^3 - 9$ is irreducible in $\mathbb{F}_{31}$.-/


```lean
theorem exercise_11_4_6c : Irreducible (X^3 - 9 : Polynomial (ZMod 31)) :=
```

## Statement 160
/-- Let $p$ be a prime integer. Prove that the polynomial $x^n-p$ is irreducible in $\mathbb{Q}[x]$.-/


```lean
theorem exercise_11_4_8 (p : ℕ) (hp : Prime p) (n : ℕ) :
  -- p ∈ ℕ can be written as p ∈ ℚ[X]
  Irreducible (X ^ n - (p : Polynomial ℚ) : Polynomial ℚ) :=
```

## Statement 161
/-- Prove that there are infinitely many primes congruent to $-1$ (modulo $4$).-/


```lean
theorem exercise_11_13_3 (N : ℕ):
  ∃ p ≥ N, Nat.Prime p ∧ p + 1 ≡ 0 [MOD 4] :=
```

## Statement 162
/-- Prove that if a prime integer $p$ has the form $2^r+1$, then it actually has the form $2^{2^k}+1$.-/


```lean
theorem exercise_13_4_10
    {p : ℕ} {hp : Nat.Prime p} (h : ∃ r : ℕ, p = 2 ^ r + 1) :
    ∃ (k : ℕ), p = 2 ^ (2 ^ k) + 1 :=
```

## Statement 163
/-- Let $K$ be a finite field. Prove that the product of the nonzero elements of $K$ is $-1$.-/


```lean
theorem exercise_13_6_10 {K : Type*} [Field K] [Fintype Kˣ] :
  (∏ x : Kˣ,  x) = -1 :=
```

## Statement 164
/-- Show that $\frac{-1 + \sqrt{3}i}{2}$ is a cube root of 1 (meaning that its cube equals 1).-/


```lean
theorem exercise_1_2 :
  (⟨-1/2, Real.sqrt 3 / 2⟩ : ℂ) ^ 3 = -1 :=
```

## Statement 165
/-- Prove that $-(-v) = v$ for every $v \in V$.-/


```lean
theorem exercise_1_3 {F V : Type*} [AddCommGroup V] [Field F]
  [Module F V] {v : V} : -(-v) = v :=
```

## Statement 166
/-- Prove that if $a \in \mathbf{F}$, $v \in V$, and $av = 0$, then $a = 0$ or $v = 0$.-/


```lean
theorem exercise_1_4 {F V : Type*} [AddCommGroup V] [Field F]
  [Module F V] (v : V) (a : F): a • v = 0 ↔ a = 0 ∨ v = 0 :=
```

## Statement 167
/-- Give an example of a nonempty subset $U$ of $\mathbf{R}^2$ such that $U$ is closed under addition and under taking additive inverses (meaning $-u \in U$ whenever $u \in U$), but $U$ is not a subspace of $\mathbf{R}^2$.-/


```lean
theorem exercise_1_6 : ∃ U : Set (ℝ × ℝ),
  (U ≠ ∅) ∧
  (∀ (u v : ℝ × ℝ), u ∈ U ∧ v ∈ U → u + v ∈ U) ∧
  (∀ (u : ℝ × ℝ), u ∈ U → -u ∈ U) ∧
  (∀ U' : Submodule ℝ (ℝ × ℝ), U ≠ ↑U') :=
```

## Statement 168
/-- Give an example of a nonempty subset $U$ of $\mathbf{R}^2$ such that $U$ is closed under scalar multiplication, but $U$ is not a subspace of $\mathbf{R}^2$.-/


```lean
theorem exercise_1_7 : ∃ U : Set (ℝ × ℝ),
  (U ≠ ∅) ∧
  (∀ (c : ℝ) (u : ℝ × ℝ), u ∈ U → c • u ∈ U) ∧
  (∀ U' : Submodule ℝ (ℝ × ℝ), U ≠ ↑U') :=
```

## Statement 169
/-- Prove that the intersection of any collection of subspaces of $V$ is a subspace of $V$.-/


```lean
theorem exercise_1_8 {F V : Type*} [AddCommGroup V] [Field F]
  [Module F V] {ι : Type*} (u : ι → Submodule F V) :
  ∃ U : Submodule F V, (⋂ (i : ι), (u i).carrier) = ↑U :=
```

## Statement 170
/-- Prove that the union of two subspaces of $V$ is a subspace of $V$ if and only if one of the subspaces is contained in the other.-/


```lean
theorem exercise_1_9 {F V : Type*} [AddCommGroup V] [Field F]
  [Module F V] (U W : Submodule F V):
  ∃ U' : Submodule F V, (U'.carrier = ↑U ∩ ↑W ↔ (U ≤ W ∨ W ≤ U)) :=
```

## Statement 171
/-- Show that every linear map from a one-dimensional vector space to itself is multiplication by some scalar. More precisely, prove that if $\operatorname{dim} V=1$ and $T \in \mathcal{L}(V, V)$, then there exists $a \in \mathbf{F}$ such that $T v=a v$ for all $v \in V$.-/


```lean
theorem exercise_3_1 {F V : Type*}
  [AddCommGroup V] [Field F] [Module F V] [FiniteDimensional F V]
  (T : V →ₗ[F] V) (hT : finrank F V = 1) :
  ∃ c : F, ∀ v : V, T v = c • v :=
```

## Statement 172
/-- Suppose that $V$ is finite dimensional and that $T \in \mathcal{L}(V, W)$. Prove that there exists a subspace $U$ of $V$ such that $U \cap \operatorname{null} T=\{0\}$ and range $T=\{T u: u \in U\}$.-/


```lean
theorem exercise_3_8 {F V W : Type*}  [AddCommGroup V]
  [AddCommGroup W] [Field F] [Module F V] [Module F W]
  (L : V →ₗ[F] W) :
  ∃ U : Submodule F V, U ⊓ (ker L) = ⊥ ∧
  (range L = range (domRestrict L U)) :=
```

## Statement 173
/-- Suppose $p \in \mathcal{P}(\mathbf{C})$ has degree $m$. Prove that $p$ has $m$ distinct roots if and only if $p$ and its derivative $p^{\prime}$ have no roots in common.-/


```lean
theorem exercise_4_4 (p : Polynomial ℂ) :
  p.degree = @card (rootSet p ℂ) (rootSetFintype p ℂ) ↔
  Disjoint
  (@card (rootSet (derivative p) ℂ) (rootSetFintype (derivative p) ℂ))
  (@card (rootSet p ℂ) (rootSetFintype p ℂ)) :=
```

## Statement 174
/-- Suppose $T \in \mathcal{L}(V)$. Prove that if $U_{1}, \ldots, U_{m}$ are subspaces of $V$ invariant under $T$, then $U_{1}+\cdots+U_{m}$ is invariant under $T$.-/


```lean
theorem exercise_5_1 {F V : Type*} [AddCommGroup V] [Field F]
  [Module F V] {L : V →ₗ[F] V} {n : ℕ} (U : Fin n → Submodule F V)
  (hU : ∀ i : Fin n, Submodule.map L (U i) = U i) :
  Submodule.map L (∑ i : Fin n, U i : Submodule F V) =
  (∑ i : Fin n, U i : Submodule F V) :=
```

## Statement 175
/-- Suppose that $S, T \in \mathcal{L}(V)$ are such that $S T=T S$. Prove that $\operatorname{null} (T-\lambda I)$ is invariant under $S$ for every $\lambda \in \mathbf{F}$.-/


```lean
theorem exercise_5_4 {F V : Type*} [AddCommGroup V] [Field F]
  [Module F V] (S T : V →ₗ[F] V) (hST : S ∘ T = T ∘ S) (c : F):
  Submodule.map S (ker (T - c • LinearMap.id)) = ker (T - c • LinearMap.id) :=
```

## Statement 176
/-- Suppose $S, T \in \mathcal{L}(V)$. Prove that $S T$ and $T S$ have the same eigenvalues.-/


```lean
theorem exercise_5_11 {F V : Type*} [AddCommGroup V] [Field F]
  [Module F V] (S T : End F V) :
  (S * T).Eigenvalues = (T * S).Eigenvalues :=
```

## Statement 177
/-- Suppose $T \in \mathcal{L}(V)$ is such that every vector in $V$ is an eigenvector of $T$. Prove that $T$ is a scalar multiple of the identity operator.-/


```lean
theorem exercise_5_12 {F V : Type*} [AddCommGroup V] [Field F]
  [Module F V] {S : End F V}
  (hS : ∀ v : V, ∃ c : F, v ∈ eigenspace S c) :
  ∃ c : F, S = c • LinearMap.id :=
```

## Statement 178
/-- Suppose $T \in \mathcal{L}(V)$ is such that every subspace of $V$ with dimension $\operatorname{dim} V-1$ is invariant under $T$. Prove that $T$ is a scalar multiple of the identity operator.-/


```lean
theorem exercise_5_13 {F V : Type*} [AddCommGroup V] [Field F]
  [Module F V] [FiniteDimensional F V] {T : End F V}
  (hS : ∀ U : Submodule F V, finrank F U = finrank F V - 1 →
  Submodule.map T U = U) : ∃ c : F, T = c • LinearMap.id :=
```

## Statement 179
/-- Suppose that $T \in \mathcal{L}(V)$ has $\operatorname{dim} V$ distinct eigenvalues and that $S \in \mathcal{L}(V)$ has the same eigenvectors as $T$ (not necessarily with the same eigenvalues). Prove that $S T=T S$.-/


```lean
theorem exercise_5_20 {F V : Type*} [AddCommGroup V] [Field F]
  [Module F V] [FiniteDimensional F V] {S T : End F V}
  (h1 : card (T.Eigenvalues) = finrank F V)
  (h2 : ∀ v : V, ∃ c : F, v ∈ eigenspace S c ↔ ∃ c : F, v ∈ eigenspace T c) :
  S * T = T * S :=
```

## Statement 180
/-- Suppose $V$ is a real vector space and $T \in \mathcal{L}(V)$ has no eigenvalues. Prove that every subspace of $V$ invariant under $T$ has even dimension.-/


```lean
theorem exercise_5_24 {V : Type*} [AddCommGroup V]
  [Module ℝ V] [FiniteDimensional ℝ V] {T : End ℝ V}
  (hT : ∀ c : ℝ, eigenspace T c = ⊥) {U : Submodule ℝ V}
  (hU : Submodule.map T U = U) : Even (finrank U) :=
```

## Statement 181
/-- Suppose $u, v \in V$. Prove that $\langle u, v\rangle=0$ if and only if $\|u\| \leq\|u+a v\|$ for all $a \in \mathbf{F}$.-/


```lean
theorem exercise_6_2 {V : Type*} [NormedAddCommGroup V] [Module ℂ V]
[InnerProductSpace ℂ V] (u v : V) :
  ⟪u, v⟫_ℂ = 0 ↔ ∀ (a : ℂ), ‖u‖  ≤ ‖u + a • v‖ :=
```

## Statement 182
/-- Prove that $\left(\sum_{j=1}^{n} a_{j} b_{j}\right)^{2} \leq\left(\sum_{j=1}^{n} j a_{j}{ }^{2}\right)\left(\sum_{j=1}^{n} \frac{b_{j}{ }^{2}}{j}\right)$ for all real numbers $a_{1}, \ldots, a_{n}$ and $b_{1}, \ldots, b_{n}$.-/


```lean
theorem exercise_6_3 {n : ℕ} (a b : Fin n → ℝ) :
  (∑ i, a i * b i) ^ 2 ≤ (∑ i : Fin n, i * a i ^ 2) * (∑ i, b i ^ 2 / i) :=
```

## Statement 183
/-- Prove that if $V$ is a complex inner-product space, then $\langle u, v\rangle=\frac{\|u+v\|^{2}-\|u-v\|^{2}+\|u+i v\|^{2} i-\|u-i v\|^{2} i}{4}$ for all $u, v \in V$.-/


```lean
theorem exercise_6_7 {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℂ V] (u v : V) :
  ⟪u, v⟫_ℂ = (‖u + v‖^2 - ‖u - v‖^2 + I*‖u + I•v‖^2 - I*‖u-I•v‖^2) / 4 :=
```

## Statement 184
/-- Suppose $\left(e_{1}, \ldots, e_{m}\right)$ is an or thonormal list of vectors in $V$. Let $v \in V$. Prove that $\|v\|^{2}=\left|\left\langle v, e_{1}\right\rangle\right|^{2}+\cdots+\left|\left\langle v, e_{m}\right\rangle\right|^{2}$ if and only if $v \in \operatorname{span}\left(e_{1}, \ldots, e_{m}\right)$.-/


```lean
theorem exercise_6_13 {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℂ V] {n : ℕ}
  {e : Fin n → V} (he : Orthonormal ℂ e) (v : V) :
  ‖v‖^2 = ∑ i : Fin n, ‖⟪v, e i⟫_ℂ‖^2 ↔ v ∈ Submodule.span ℂ (e '' Set.univ) :=
```

## Statement 185
/-- Suppose $U$ is a subspace of $V$. Prove that $U^{\perp}=\{0\}$ if and only if $U=V$-/


```lean
theorem exercise_6_16 {K V : Type*} [RCLike K] [NormedAddCommGroup V] [InnerProductSpace K V]
  {U : Submodule K V} :
  U.orthogonal = ⊥  ↔ U = ⊤ :=
```

## Statement 186
/-- Show that if $\operatorname{dim} V \geq 2$, then the set of normal operators on $V$ is not a subspace of $\mathcal{L}(V)$.-/


```lean
theorem exercise_7_5 {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℂ V]
  [FiniteDimensional ℂ V] (hV : finrank V ≥ 2) :
  ∀ U : Submodule ℂ (End ℂ V), U.carrier ≠
  {T | T * adjoint T = adjoint T * T} :=
```

## Statement 187
/-- Prove that if $T \in \mathcal{L}(V)$ is normal, then $\operatorname{range} T=\operatorname{range} T^{*}.$-/


```lean
theorem exercise_7_6 {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℂ V]
  [FiniteDimensional ℂ V] (T : End ℂ V)
  (hT : T * adjoint T = adjoint T * T) :
  range T = range (adjoint T) :=
```

## Statement 188
/-- Prove that a normal operator on a complex inner-product space is self-adjoint if and only if all its eigenvalues are real.-/


```lean
theorem exercise_7_9 {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℂ V]
  [FiniteDimensional ℂ V] (T : End ℂ V)
  (hT : T * adjoint T = adjoint T * T) :
  IsSelfAdjoint T ↔ ∀ e : T.Eigenvalues, (e : ℂ).im = 0 :=
```

## Statement 189
/-- Suppose $V$ is a complex inner-product space and $T \in \mathcal{L}(V)$ is a normal operator such that $T^{9}=T^{8}$. Prove that $T$ is self-adjoint and $T^{2}=T$.-/


```lean
theorem exercise_7_10 {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℂ V]
  [FiniteDimensional ℂ V] (T : End ℂ V)
  (hT : T * adjoint T = adjoint T * T) (hT1 : T^9 = T^8) :
  IsSelfAdjoint T ∧ T^2 = T :=
```

## Statement 190
/-- Suppose $V$ is a complex inner-product space. Prove that every normal operator on $V$ has a square root. (An operator $S \in \mathcal{L}(V)$ is called a square root of $T \in \mathcal{L}(V)$ if $S^{2}=T$.)-/


```lean
theorem exercise_7_11 {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℂ V]
  [FiniteDimensional ℂ V] {T : End ℂ V} (hT : T*adjoint T = adjoint T*T) :
  ∃ (S : End ℂ V), S ^ 2 = T :=
```

## Statement 191
/-- Suppose $T \in \mathcal{L}(V)$ is self-adjoint, $\lambda \in \mathbf{F}$, and $\epsilon>0$. Prove that if there exists $v \in V$ such that $\|v\|=1$ and $\|T v-\lambda v\|<\epsilon,$ then $T$ has an eigenvalue $\lambda^{\prime}$ such that $\left|\lambda-\lambda^{\prime}\right|<\epsilon$.-/


```lean
theorem exercise_7_14 {𝕜 V : Type*} [RCLike 𝕜] [NormedAddCommGroup V]
  [InnerProductSpace 𝕜 V] [FiniteDimensional 𝕜 V]
  {T : Module.End 𝕜 V} (hT : IsSelfAdjoint T)
  {l : 𝕜} {ε : ℝ} (he : ε > 0) : ∃ v : V, ‖v‖= 1 ∧ (‖T v - l • v‖ < ε →
  (∃ l' : T.Eigenvalues, ‖l - l'‖ < ε)) :=
```

## Statement 192
/-- Prove the the operation $\star$ on $\mathbb{Z}$ defined by $a\star b=a-b$ is not commutative.-/


```lean
theorem exercise_1_1_2a : ∃ a b : ℤ, a - b ≠ b - a :=
```

## Statement 193
/-- Prove that the addition of residue classes $\mathbb{Z}/n\mathbb{Z}$ is associative.-/


```lean
theorem exercise_1_1_3 (n : ℤ) :
  ∀ (a b c : ℤ), (a+b)+c ≡ a+(b+c) [ZMOD n] :=
```

## Statement 194
/-- Prove that the multiplication of residue class $\mathbb{Z}/n\mathbb{Z}$ is associative.-/


```lean
theorem exercise_1_1_4 (n : ℕ) :
  ∀ (a b c : ℕ), (a * b) * c ≡ a * (b * c) [ZMOD n] :=
```

## Statement 195
/-- Prove that for all $n>1$ that $\mathbb{Z}/n\mathbb{Z}$ is not a group under multiplication of residue classes.-/


```lean
theorem exercise_1_1_5 (n : ℕ) (hn : 1 < n) :
  IsEmpty (Group (ZMod n)) :=
```

## Statement 196
/-- Prove that $(a_1a_2\dots a_n)^{-1} = a_n^{-1}a_{n-1}^{-1}\dots a_1^{-1}$ for all $a_1, a_2, \dots, a_n\in G$.-/


```lean
theorem exercise_1_1_15 {G : Type*} [Group G] (as : List G) :
  as.prod⁻¹ = (as.reverse.map (λ x => x⁻¹)).prod :=
```

## Statement 197
/-- Let $x$ be an element of $G$. Prove that $x^2=1$ if and only if $|x|$ is either $1$ or $2$.-/


```lean
theorem exercise_1_1_16 {G : Type*} [Group G]
  (x : G) (hx : x ^ 2 = 1) :
  orderOf x = 1 ∨ orderOf x = 2 :=
```

## Statement 198
/-- Let $x$ be an element of $G$. Prove that if $|x|=n$ for some positive integer $n$ then $x^{-1}=x^{n-1}$.-/


```lean
theorem exercise_1_1_17 {G : Type*} [Group G] {x : G} {n : ℕ}
  (hxn: orderOf x = n) :
  x⁻¹ = x ^ (n - 1 : ℤ) :=
```

## Statement 199
/-- Let $x$ and $y$ be elements of $G$. Prove that $xy=yx$ if and only if $y^{-1}xy=x$ if and only if $x^{-1}y^{-1}xy=1$.-/


```lean
theorem exercise_1_1_18 {G : Type*} [Group G]
  (x y : G) : (x * y = y * x ↔ y⁻¹ * x * y = x) ↔ (x⁻¹ * y⁻¹ * x * y = 1) :=
```

## Statement 200
/-- For $x$ an element in $G$ show that $x$ and $x^{-1}$ have the same order.-/


```lean
theorem exercise_1_1_20 {G : Type*} [Group G] {x : G} :
  orderOf x = orderOf x⁻¹ :=
```

## Statement 201
/-- If $x$ and $g$ are elements of the group $G$, prove that $|x|=\left|g^{-1} x g\right|$.-/


```lean
theorem exercise_1_1_22a {G : Type*} [Group G] (x g : G) :
  orderOf x = orderOf (g⁻¹ * x * g) :=
```

## Statement 202
/-- Deduce that $|a b|=|b a|$ for all $a, b \in G$.-/


```lean
theorem exercise_1_1_22b {G: Type*} [Group G] (a b : G) :
  orderOf (a * b) = orderOf (b * a) :=
```

## Statement 203
/-- Prove that if $x^{2}=1$ for all $x \in G$ then $G$ is abelian.-/


```lean
theorem exercise_1_1_25 {G : Type*} [Group G]
  (h : ∀ x : G, x ^ 2 = 1) : ∀ a b : G, a*b = b*a :=
```

## Statement 204
/-- Prove that $A \times B$ is an abelian group if and only if both $A$ and $B$ are abelian.-/


```lean
theorem exercise_1_1_29 {A B : Type*} [Group A] [Group B] :
  ∀ x y : A × B, x*y = y*x ↔ (∀ x y : A, x*y = y*x) ∧
  (∀ x y : B, x*y = y*x) :=
```

## Statement 205
/-- If $x$ is an element of infinite order in $G$, prove that the elements $x^{n}, n \in \mathbb{Z}$ are all distinct.-/


```lean
theorem exercise_1_1_34 {G : Type*} [Group G] {x : G}
  (hx_inf : orderOf x = 0) (n m : ℤ) :
  x ^ n ≠ x ^ m :=
```

## Statement 206
/-- Prove that if $\Omega=\{1,2,3, \ldots\}$ then $S_{\Omega}$ is an infinite group-/


```lean
theorem exercise_1_3_8 : Infinite (Equiv.Perm ℕ) :=
```

## Statement 207
/-- Prove that the multiplicative groups $\mathbb{R}-\{0\}$ and $\mathbb{C}-\{0\}$ are not isomorphic.-/


```lean
theorem exercise_1_6_4 :
  IsEmpty (Multiplicative ℝ ≃* Multiplicative ℂ) :=
```

## Statement 208
/-- Let $A$ and $B$ be groups. Prove that $A \times B \cong B \times A$.-/


```lean
noncomputable def exercise_1_6_11 {A B : Type*} [Group A] [Group B] :
  A × B ≃* B × A :=
```

## Statement 209
/-- Let $G$ be any group. Prove that the map from $G$ to itself defined by $g \mapsto g^{-1}$ is a homomorphism if and only if $G$ is abelian.-/


```lean
theorem exercise_1_6_17 {G : Type*} [Group G] (f : G → G)
  (hf : f = λ g => g⁻¹) :
  ∀ x y : G, f x * f y = f (x*y) ↔ ∀ x y : G, x*y = y*x :=
```

## Statement 210
/-- Let $G$ be a finite group which possesses an automorphism $\sigma$ such that $\sigma(g)=g$ if and only if $g=1$. If $\sigma^{2}$ is the identity map from $G$ to $G$, prove that $G$ is abelian.-/


```lean
theorem exercise_1_6_23 {G : Type*}
  [Group G] (σ : MulAut G) (hs : ∀ g : G, σ g = 1 → g = 1)
  (hs2 : ∀ g : G, σ (σ g) = g) :
  ∀ x y : G, x*y = y*x :=
```

## Statement 211
/-- Prove that $G$ cannot have a subgroup $H$ with $|H|=n-1$, where $n=|G|>2$.-/


```lean
theorem exercise_2_1_5 {G : Type*} [Group G] [Fintype G]
  (hG : card G > 2) (H : Subgroup G) [Fintype H] :
  card H ≠ card G - 1 :=
```

## Statement 212
/-- Let $H$ be a subgroup of the additive group of rational numbers with the property that $1 / x \in H$ for every nonzero element $x$ of $H$. Prove that $H=0$ or $\mathbb{Q}$.-/


```lean
theorem exercise_2_1_13 (H : AddSubgroup ℚ) {x : ℚ}
  (hH : x ∈ H → (1 / x) ∈ H):
  H = ⊥ ∨ H = ⊤ :=
```

## Statement 213
/-- Prove that if $H$ is a subgroup of $G$ then $H$ is generated by the set $H-\{1\}$.-/


```lean
theorem exercise_2_4_4 {G : Type*} [Group G] (H : Subgroup G) :
  closure ((H : Set G) \ {1}) = ⊤ :=
```

## Statement 214
/-- A subgroup $M$ of a group $G$ is called a maximal subgroup if $M \neq G$ and the only subgroups of $G$ which contain $M$ are $M$ and $G$. Prove that if $H$ is a proper subgroup of the finite group $G$ then there is a maximal subgroup of $G$ containing $H$.-/


```lean
theorem exercise_2_4_16a {G : Type*} [Group G] {H : Subgroup G}
  (hH : H ≠ ⊤) :
  ∃ M : Subgroup G, M ≠ ⊤ ∧
  ∀ K : Subgroup G, M ≤ K → K = M ∨ K = ⊤ ∧
  H ≤ M :=
```

## Statement 215
/-- Show that the subgroup of all rotations in a dihedral group is a maximal subgroup.-/


```lean
theorem exercise_2_4_16b {n : ℕ} {hn : n ≠ 0}
  {R : Subgroup (DihedralGroup n)}
  (hR : R = Subgroup.closure {DihedralGroup.r 1}) :
  R ≠ ⊤ ∧
  ∀ K : Subgroup (DihedralGroup n), R ≤ K → K = R ∨ K = ⊤ :=
```

## Statement 216
/-- Show that if $G=\langle x\rangle$ is a cyclic group of order $n \geq 1$ then a subgroup $H$ is maximal if and only $H=\left\langle x^{p}\right\rangle$ for some prime $p$ dividing $n$.-/


```lean
theorem exercise_2_4_16c {n : ℕ} (H : AddSubgroup (ZMod n)) :
  ∃ p : (ZMod n), Prime p ∧ H = AddSubgroup.closure {p} ↔
  (H ≠ ⊤ ∧ ∀ K : AddSubgroup (ZMod n), H ≤ K → K = H ∨ K = ⊤) :=
```

## Statement 217
/-- Let $A$ be an abelian group and let $B$ be a subgroup of $A$. Prove that $A / B$ is abelian.-/


```lean
theorem exercise_3_1_3a {A : Type*} [CommGroup A] (B : Subgroup A) :
  ∀ a b : A ⧸ B, a*b = b*a :=
```

## Statement 218
/-- Prove that if $H$ and $K$ are normal subgroups of a group $G$ then their intersection $H \cap K$ is also a normal subgroup of $G$.-/


```lean
theorem exercise_3_1_22a (G : Type*) [Group G] (H K : Subgroup G)
  [Normal H] [Normal K] :
  Normal (H ⊓ K) :=
```

## Statement 219
/-- Prove that the intersection of an arbitrary nonempty collection of normal subgroups of a group is a normal subgroup (do not assume the collection is countable).-/


```lean
theorem exercise_3_1_22b {G : Type*} [Group G] (I : Type*)
  (H : I → Subgroup G) (hH : ∀ i : I, Normal (H i)) :
  Normal (⨅ (i : I), H i) :=
```

## Statement 220
/-- Prove that if $H$ and $K$ are finite subgroups of $G$ whose orders are relatively prime then $H \cap K=1$.-/


```lean
theorem exercise_3_2_8 {G : Type*} [Group G] (H K : Subgroup G)
  [Fintype H] [Fintype K]
  (hHK : Nat.Coprime (card H) (card K)) :
  H ⊓ K = ⊥ :=
```

## Statement 221
/-- Let $H \leq K \leq G$. Prove that $|G: H|=|G: K| \cdot|K: H|$ (do not assume $G$ is finite).-/


```lean
theorem exercise_3_2_11 {G : Type*} [Group G] {H K : Subgroup G}
  (hHK : H ≤ K) :
  H.index = K.index * H.relindex K :=
```

## Statement 222
/-- Use Lagrange's Theorem in the multiplicative group $(\mathbb{Z} / p \mathbb{Z})^{\times}$to prove Fermat's Little Theorem: if $p$ is a prime then $a^{p} \equiv a(\bmod p)$ for all $a \in \mathbb{Z}$.-/


```lean
theorem exercise_3_2_16 (p : ℕ) (hp : Nat.Prime p) (a : ℕ) :
  Nat.Coprime a p → a ^ p ≡ a [ZMOD p] :=
```

## Statement 223
/-- Prove that $\mathbb{Q}$ has no proper subgroups of finite index.-/


```lean
theorem exercise_3_2_21a (H : AddSubgroup ℚ) (hH : H ≠ ⊤) : H.index = 0 :=
```

## Statement 224
/-- Prove that if $H$ is a normal subgroup of $G$ of prime index $p$ then for all $K \leq G$ either $K \leq H$, or $G=H K$ and $|K: K \cap H|=p$.-/


```lean
theorem exercise_3_3_3 {p : Nat.Primes} {G : Type*} [Group G]
  {H : Subgroup G} [hH : H.Normal] (hH1 : H.index = p) :
  ∀ K : Subgroup G, K ≤ H ∨ H ⊔ K = ⊤ ∨ (K ⊓ H).relindex K = p :=
```

## Statement 225
/-- Prove that if $G$ is an abelian simple group then $G \cong Z_{p}$ for some prime $p$ (do not assume $G$ is a finite group).-/


```lean
theorem exercise_3_4_1 (G : Type*) [CommGroup G] [IsSimpleGroup G] :
    IsCyclic G ∧ ∃ G_fin : Fintype G, Nat.Prime (@card G G_fin) :=
```

## Statement 226
/-- Use Cauchy's Theorem and induction to show that a finite abelian group has a subgroup of order $n$ for each positive divisor $n$ of its order.-/


```lean
theorem exercise_3_4_4 {G : Type*} [CommGroup G] [Fintype G] {n : ℕ}
    (hn : n ∣ (card G)) :
    ∃ (H : Subgroup G) (H_fin : Fintype H), @card H H_fin = n :=
```

## Statement 227
/-- Prove that subgroups of a solvable group are solvable.-/


```lean
theorem exercise_3_4_5a {G : Type*} [Group G]
  (H : Subgroup G) [IsSolvable G] : IsSolvable H :=
```

## Statement 228
/-- Prove that quotient groups of a solvable group are solvable.-/


```lean
theorem exercise_3_4_5b {G : Type*} [Group G] [IsSolvable G]
  (H : Subgroup G) [Normal H] :
  IsSolvable (G ⧸ H) :=
```

## Statement 229
/-- Prove that if $H$ is a nontrivial normal subgroup of the solvable group $G$ then there is a nontrivial subgroup $A$ of $H$ with $A \unlhd G$ and $A$ abelian.-/


```lean
theorem exercise_3_4_11 {G : Type*} [Group G] [IsSolvable G]
  {H : Subgroup G} (hH : H ≠ ⊥) [H.Normal] :
  ∃ A ≤ H, A.Normal ∧ ∀ a b : A, a*b = b*a :=
```

## Statement 230
/-- Prove that if $H$ has finite index $n$ then there is a normal subgroup $K$ of $G$ with $K \leq H$ and $|G: K| \leq n!$.-/


```lean
theorem exercise_4_2_8 {G : Type*} [Group G] {H : Subgroup G}
  {n : ℕ} (hn : n > 0) (hH : H.index = n) :
  ∃ K ≤ H, K.Normal ∧ K.index ≤ n.factorial :=
```

## Statement 231
/-- Let $G$ be a transitive permutation group on the finite set $A$ with $|A|>1$. Show that there is some $\sigma \in G$ such that $\sigma(a) \neq a$ for all $a \in A$.-/


```lean
theorem exercise_4_3_26 {α : Type*} [Fintype α] (ha : card α > 1)
  (h_tran : ∀ a b: α, ∃ σ : Equiv.Perm α, σ a = b) :
  ∃ σ : Equiv.Perm α, ∀ a : α, σ a ≠ a :=
```

## Statement 232
/-- Prove that if $p$ is a prime and $G$ is a group of order $p^{\alpha}$ for some $\alpha \in \mathbb{Z}^{+}$, then every subgroup of index $p$ is normal in $G$.-/


```lean
theorem exercise_4_2_9a {G : Type*} [Fintype G] [Group G] {p α : ℕ}
  (hp : p.Prime) (ha : α > 0) (hG : card G = p ^ α) :
  ∀ H : Subgroup G, H.index = p → H.Normal :=
```

## Statement 233
/-- Let $G$ be a finite group of composite order $n$ with the property that $G$ has a subgroup of order $k$ for each positive integer $k$ dividing $n$. Prove that $G$ is not simple.-/


```lean
theorem exercise_4_2_14 {G : Type*} [Fintype G] [Group G]
  (hG : ¬ (card G).Prime) (hG1 : ∀ k : ℕ, k ∣ card G →
  ∃ (H : Subgroup G) (fH : Fintype H), @card H fH = k) :
  ¬ IsSimpleGroup G :=
```

## Statement 234
/-- Prove that if $G$ is an abelian group of order $p q$, where $p$ and $q$ are distinct primes, then $G$ is cyclic.-/


```lean
theorem exercise_4_4_2 {G : Type*} [Fintype G] [Group G]
  {p q : Nat.Primes} (hpq : p ≠ q) (hG : card G = p*q) :
  IsCyclic G :=
```

## Statement 235
/-- Prove that characteristic subgroups are normal.-/


```lean
theorem exercise_4_4_6a {G : Type*} [Group G] (H : Subgroup G)
  [Characteristic H] : Normal H :=
```

## Statement 236
/-- Prove that there exists a normal subgroup that is not characteristic.-/


```lean
theorem exercise_4_4_6b :
  ∃ (G : Type*) (hG : Group G) (H : @Subgroup G hG), @Characteristic G hG H  ∧ ¬ @Normal G hG H :=
```

## Statement 237
/-- If $H$ is the unique subgroup of a given order in a group $G$ prove $H$ is characteristic in $G$.-/


```lean
theorem exercise_4_4_7 {G : Type*} [Group G] {H : Subgroup G} [Fintype H]
  (hH : ∀ (K : Subgroup G) (fK : Fintype K), card H = @card K fK → H = K) :
  H.Characteristic :=
```

## Statement 238
/-- Let $G$ be a group with subgroups $H$ and $K$ with $H \leq K$. Prove that if $H$ is characteristic in $K$ and $K$ is normal in $G$ then $H$ is normal in $G$.-/


```lean
theorem exercise_4_4_8a {G : Type*} [Group G] (H K : Subgroup G)
  (hHK : H ≤ K) [hHK1 : (H.subgroupOf K).Normal] [hK : K.Normal] :
  H.Normal :=
```

## Statement 239
/-- Prove that if $P \in \operatorname{Syl}_{p}(G)$ and $H$ is a subgroup of $G$ containing $P$ then $P \in \operatorname{Syl}_{p}(H)$.-/


```lean
theorem exercise_4_5_1a {p : ℕ} {G : Type*} [Group G]
  {P : Subgroup G} (hP : IsPGroup p P) (H : Subgroup G)
  (hH : P ≤ H) : IsPGroup p H :=
```

## Statement 240
/-- Prove that a group of order 56 has a normal Sylow $p$-subgroup for some prime $p$ dividing its order.-/


```lean
theorem exercise_4_5_13 {G : Type*} [Group G] [Fintype G]
  (hG : card G = 56) :
  ∃ (p : ℕ) (P : Sylow p G), P.Normal :=
```

## Statement 241
/-- Prove that a group of order 312 has a normal Sylow $p$-subgroup for some prime $p$ dividing its order.-/


```lean
theorem exercise_4_5_14 {G : Type*} [Group G] [Fintype G]
  (hG : card G = 312) :
  ∃ (p : ℕ) (P : Sylow p G), P.Normal :=
```

## Statement 242
/-- Prove that a group of order 351 has a normal Sylow $p$-subgroup for some prime $p$ dividing its order.-/


```lean
theorem exercise_4_5_15 {G : Type*} [Group G] [Fintype G]
  (hG : card G = 351) :
  ∃ (p : ℕ) (P : Sylow p G), P.Normal :=
```

## Statement 243
/-- Let $|G|=p q r$, where $p, q$ and $r$ are primes with $p<q<r$. Prove that $G$ has a normal Sylow subgroup for either $p, q$ or $r$.-/


```lean
theorem exercise_4_5_16 {p q r : ℕ} {G : Type*} [Group G]
  [Fintype G]  (hpqr : p < q ∧ q < r)
  (hpqr1 : p.Prime ∧ q.Prime ∧ r.Prime)(hG : card G = p*q*r) :
  Nonempty (Sylow p G) ∨ Nonempty (Sylow q G) ∨ Nonempty (Sylow r G) :=
```

## Statement 244
/-- Prove that if $|G|=105$ then $G$ has a normal Sylow 5 -subgroup and a normal Sylow 7-subgroup.-/


```lean
theorem exercise_4_5_17 {G : Type*} [Fintype G] [Group G]
  (hG : card G = 105) :
  Nonempty (Sylow 5 G) ∧ Nonempty (Sylow 7 G) :=
```

## Statement 245
/-- Prove that a group of order 200 has a normal Sylow 5-subgroup.-/


```lean
theorem exercise_4_5_18 {G : Type*} [Fintype G] [Group G]
  (hG : card G = 200) :
  ∃ N : Sylow 5 G, N.Normal :=
```

## Statement 246
/-- Prove that if $|G|=6545$ then $G$ is not simple.-/


```lean
theorem exercise_4_5_19 {G : Type*} [Fintype G] [Group G]
  (hG : card G = 6545) : ¬ IsSimpleGroup G :=
```

## Statement 247
/-- Prove that if $|G|=1365$ then $G$ is not simple.-/


```lean
theorem exercise_4_5_20 {G : Type*} [Fintype G] [Group G]
  (hG : card G = 1365) : ¬ IsSimpleGroup G :=
```

## Statement 248
/-- Prove that if $|G|=2907$ then $G$ is not simple.-/


```lean
theorem exercise_4_5_21 {G : Type*} [Fintype G] [Group G]
  (hG : card G = 2907) : ¬ IsSimpleGroup G :=
```

## Statement 249
/-- Prove that if $|G|=132$ then $G$ is not simple.-/


```lean
theorem exercise_4_5_22 {G : Type*} [Fintype G] [Group G]
  (hG : card G = 132) : ¬ IsSimpleGroup G :=
```

## Statement 250
/-- Prove that if $|G|=462$ then $G$ is not simple.-/


```lean
theorem exercise_4_5_23 {G : Type*} [Fintype G] [Group G]
  (hG : card G = 462) : ¬ IsSimpleGroup G :=
```

## Statement 251
/-- Let $G$ be a group of order 105. Prove that if a Sylow 3-subgroup of $G$ is normal then $G$ is abelian.-/


```lean
def exercise_4_5_28 {G : Type*} [Group G] [Fintype G]
  (hG : card G = 105) (P : Sylow 3 G) [hP : P.Normal] :
  CommGroup G :=
```

## Statement 252
/-- Let $P$ be a normal Sylow $p$-subgroup of $G$ and let $H$ be any subgroup of $G$. Prove that $P \cap H$ is the unique Sylow $p$-subgroup of $H$.-/


```lean
theorem exercise_4_5_33 {G : Type*} [Group G] [Fintype G] {p : ℕ}
  (P : Sylow p G) [hP : P.Normal] (H : Subgroup G) [Fintype H] :
  ∀ R : Sylow p H, R.toSubgroup = (H ⊓ P.toSubgroup).subgroupOf H ∧
  Nonempty (Sylow p H) :=
```

## Statement 253
/-- Prove that a subgroup $H$ of $G$ is normal if and only if $[G, H] \leq H$.-/


```lean
theorem exercise_5_4_2 {G : Type*} [Group G] (H : Subgroup G) :
  H.Normal ↔ ⁅(⊤ : Subgroup G), H⁆ ≤ H :=
```

## Statement 254
/-- Prove that if $u$ is a unit in $R$ then so is $-u$.-/


```lean
theorem exercise_7_1_2 {R : Type*} [Ring R] {u : R}
  (hu : IsUnit u) : IsUnit (-u) :=
```

## Statement 255
/-- Prove that if $R$ is an integral domain and $x^{2}=1$ for some $x \in R$ then $x=\pm 1$.-/


```lean
theorem exercise_7_1_11 {R : Type*} [Ring R] [IsDomain R]
  {x : R} (hx : x^2 = 1) : x = 1 ∨ x = -1 :=
```

## Statement 256
/-- Prove that any subring of a field which contains the identity is an integral domain.-/


```lean
theorem exercise_7_1_12 {F : Type*} [Field F] {K : Subring F}
  (hK : (1 : F) ∈ K) : IsDomain K :=
```

## Statement 257
/-- A ring $R$ is called a Boolean ring if $a^{2}=a$ for all $a \in R$. Prove that every Boolean ring is commutative.-/


```lean
def exercise_7_1_15 {R : Type*} [Ring R] (hR : ∀ a : R, a^2 = a) :
  CommRing R :=
```

## Statement 258
/-- Let $p(x)=a_{n} x^{n}+a_{n-1} x^{n-1}+\cdots+a_{1} x+a_{0}$ be an element of the polynomial ring $R[x]$. Prove that $p(x)$ is a zero divisor in $R[x]$ if and only if there is a nonzero $b \in R$ such that $b p(x)=0$.-/


```lean
theorem exercise_7_2_2 {R : Type*} [Ring R] (p : Polynomial R) :
  p ∣ 0 ↔ ∃ b : R, b ≠ 0 ∧ b • p = 0 :=
```

## Statement 259
/-- Let $G=\left\{g_{1}, \ldots, g_{n}\right\}$ be a finite group. Prove that the element $N=g_{1}+g_{2}+\ldots+g_{n}$ is in the center of the group ring $R G$.-/


```lean
theorem exercise_7_2_12 {R G : Type*} [Ring R] [Group G] [Fintype G] :
  ∑ g : G, MonoidAlgebra.of R G g ∈ center (MonoidAlgebra R G) :=
```

## Statement 260
/-- Let $\varphi: R \rightarrow S$ be a surjective homomorphism of rings. Prove that the image of the center of $R$ is contained in the center of $S$.-/


```lean
theorem exercise_7_3_16 {R S : Type*} [Ring R] [Ring S]
  {φ : R →+* S} (hf : Function.Surjective φ) :
  φ '' (center R) ⊂ center S :=
```

## Statement 261
/-- An ideal $N$ is called nilpotent if $N^{n}$ is the zero ideal for some $n \geq 1$. Prove that the ideal $p \mathbb{Z} / p^{m} \mathbb{Z}$ is a nilpotent ideal in the ring $\mathbb{Z} / p^{m} \mathbb{Z}$.-/


```lean
theorem exercise_7_3_37 {p m : ℕ} (hp : p.Prime) :
  IsNilpotent (span ({↑p} : Set $ ZMod $ p^m) : Ideal $ ZMod $ p^m) :=
```

## Statement 262
/-- Let $R$ be a commutative ring with $1 \neq 0$. Prove that if $a$ is a nilpotent element of $R$ then $1-a b$ is a unit for all $b \in R$.-/


```lean
theorem exercise_7_4_27 {R : Type*} [CommRing R] (hR : (0 : R) ≠ 1)
  {a : R} (ha : IsNilpotent a) (b : R) :
  IsUnit (1-a*b) :=
```

## Statement 263
/-- Let $N$ be a positive integer. Let $M$ be an integer relatively prime to $N$ and let $d$ be an integer relatively prime to $\varphi(N)$, where $\varphi$ denotes Euler's $\varphi$-function. Prove that if $M_{1} \equiv M^{d} \pmod N$ then $M \equiv M_{1}^{d^{\prime}} \pmod N$ where $d^{\prime}$ is the inverse of $d \bmod \varphi(N)$: $d d^{\prime} \equiv 1 \pmod {\varphi(N)}$.-/


```lean
theorem exercise_8_1_12 {N : ℕ} (hN : N > 0) {M M': ℤ} {d : ℕ}
  (hMN : M.gcd N = 1) (hMd : d.gcd N.totient = 1)
  (hM' : M' ≡ M^d [ZMOD N]) :
  ∃ d' : ℕ, d' * d ≡ 1 [ZMOD N.totient] ∧
  M ≡ M'^d' [ZMOD N] :=
```

## Statement 264
/-- Let $R$ be an integral domain. Prove that if the following two conditions hold then $R$ is a Principal Ideal Domain: (i) any two nonzero elements $a$ and $b$ in $R$ have a greatest common divisor which can be written in the form $r a+s b$ for some $r, s \in R$, and (ii) if $a_{1}, a_{2}, a_{3}, \ldots$ are nonzero elements of $R$ such that $a_{i+1} \mid a_{i}$ for all $i$, then there is a positive integer $N$ such that $a_{n}$ is a unit times $a_{N}$ for all $n \geq N$.-/


```lean
theorem exercise_8_2_4 {R : Type*} [Ring R][NoZeroDivisors R]
  [CancelCommMonoidWithZero R] [GCDMonoid R]
  (h1 : ∀ a b : R, a ≠ 0 → b ≠ 0 → ∃ r s : R, gcd a b = r*a + s*b)
  (h2 : ∀ a : ℕ → R, (∀ i j : ℕ, i < j → a i ∣ a j) →
  ∃ N : ℕ, ∀ n ≥ N, ∃ u : R, IsUnit u ∧ a n = u * a N) :
  IsPrincipalIdealRing R :=
```

## Statement 265
/-- Prove that if an integer is the sum of two rational squares, then it is the sum of two integer squares.-/


```lean
theorem exercise_8_3_4 {R : Type*} {n : ℤ} {r s : ℚ}
  (h : r^2 + s^2 = n) :
  ∃ a b : ℤ, a^2 + b^2 = n :=
```

## Statement 266
/-- Let $R=\mathbb{Z}[\sqrt{-n}]$ where $n$ is a squarefree integer greater than 3. Prove that $2, \sqrt{-n}$ and $1+\sqrt{-n}$ are irreducibles in $R$.-/


```lean
theorem exercise_8_3_5a {n : ℤ} (hn0 : n > 3) (hn1 : Squarefree n) :
  Irreducible (2 : Zsqrtd $ -n) ∧
  Irreducible (⟨0, 1⟩ : Zsqrtd $ -n) ∧
  Irreducible (1 + ⟨0, 1⟩ : Zsqrtd $ -n) :=
```

## Statement 267
/-- Prove that the quotient ring $\mathbb{Z}[i] /(1+i)$ is a field of order 2.-/


```lean
theorem exercise_8_3_6a {R : Type} [Ring R]
  (hR : R = (GaussianInt ⧸ span ({⟨0, 1⟩} : Set GaussianInt))) :
  IsField R ∧ ∃ finR : Fintype R, @card R finR = 2 :=
```

## Statement 268
/-- Let $q \in \mathbb{Z}$ be a prime with $q \equiv 3 \bmod 4$. Prove that the quotient ring $\mathbb{Z}[i] /(q)$ is a field with $q^{2}$ elements.-/


```lean
theorem exercise_8_3_6b {q : ℕ} (hq0 : q.Prime)
  (hq1 : q ≡ 3 [ZMOD 4]) {R : Type} [Ring R]
  (hR : R = (GaussianInt ⧸ span ({↑q} : Set GaussianInt))) :
  IsField R ∧ ∃ finR : Fintype R, @card R finR = q^2 :=
```

## Statement 269
/-- Prove that $(x, y)$ is not a principal ideal in $\mathbb{Q}[x, y]$.-/


```lean
theorem exercise_9_1_6 : ¬ Submodule.IsPrincipal
  (span ({MvPolynomial.X 0, MvPolynomial.X 1} : Set (MvPolynomial (Fin 2) ℚ))) :=
```

## Statement 270
/-- Prove that the ring $\mathbb{Z}\left[x_{1}, x_{2}, x_{3}, \ldots\right] /\left(x_{1} x_{2}, x_{3} x_{4}, x_{5} x_{6}, \ldots\right)$ contains infinitely many minimal prime ideals.-/


```lean
theorem exercise_9_1_10 {f : ℕ → MvPolynomial ℕ ℤ}
  (hf : f = λ i => MvPolynomial.X i * MvPolynomial.X (i+1)):
  Infinite (minimalPrimes (MvPolynomial ℕ ℤ ⧸ span (range f))) :=
```

## Statement 271
/-- Prove that if $f(x)$ and $g(x)$ are polynomials with rational coefficients whose product $f(x) g(x)$ has integer coefficients, then the product of any coefficient of $g(x)$ with any coefficient of $f(x)$ is an integer.-/


```lean
theorem exercise_9_3_2 {f g : Polynomial ℚ} (i j : ℕ)
  (hfg : ∀ n : ℕ, ∃ a : ℤ, (f*g).coeff = a) :
  ∃ a : ℤ, f.coeff i * g.coeff j = a :=
```

## Statement 272
/-- Prove that $x^4-4x^3+6$ is irreducible in $\mathbb{Z}[x]$.-/


```lean
theorem exercise_9_4_2a : Irreducible (X^4 - 4*X^3 + 6 : Polynomial ℤ) :=
```

## Statement 273
/-- Prove that $x^6+30x^5-15x^3 + 6x-120$ is irreducible in $\mathbb{Z}[x]$.-/


```lean
theorem exercise_9_4_2b : Irreducible
  (X^6 + 30*X^5 - 15*X^3 + 6*X - 120 : Polynomial ℤ) :=
```

## Statement 274
/-- Prove that $x^4+4x^3+6x^2+2x+1$ is irreducible in $\mathbb{Z}[x]$.-/


```lean
theorem exercise_9_4_2c : Irreducible
  (X^4 + 4*X^3 + 6*X^2 + 2*X + 1 : Polynomial ℤ) :=
```

## Statement 275
/-- Prove that $\frac{(x+2)^p-2^p}{x}$, where $p$ is an odd prime, is irreducible in $\mathbb{Z}[x]$.-/


```lean
theorem exercise_9_4_2d {p : ℕ} (hp : p.Prime ∧ p > 2)
  {f : Polynomial ℤ} (hf : f = (X + 2)^p):
  Irreducible (∑ n in (f.support \ {0}), (f.coeff n : Polynomial ℤ) * X ^ (n-1) :
  Polynomial ℤ) :=
```

## Statement 276
/-- Prove that the polynomial $x^{2}-\sqrt{2}$ is irreducible over $\mathbb{Z}[\sqrt{2}]$. You may assume that $\mathbb{Z}[\sqrt{2}]$ is a U.F.D.-/


```lean
theorem exercise_9_4_9 :
  Irreducible (X^2 - C Zsqrtd.sqrtd : Polynomial (Zsqrtd 2)) :=
```

## Statement 277
/-- Prove that $x^2+y^2-1$ is irreducible in $\mathbb{Q}[x,y]$.-/


```lean
theorem exercise_9_4_11 :
  Irreducible ((MvPolynomial.X 0)^2 + (MvPolynomial.X 1)^2 - 1 : MvPolynomial (Fin 2) ℚ) :=
```

## Statement 278
/-- Prove that as vector spaces over $\mathbb{Q}, \mathbb{R}^n \cong \mathbb{R}$, for all $n \in \mathbb{Z}^{+}$.-/


```lean
def exercise_11_1_13 {ι : Type*} [Fintype ι] :
  (ι → ℝ) ≃ₗ[ℚ] ℝ :=
```

## Statement 279
/-- Let $X$ be a topological space; let $A$ be a subset of $X$. Suppose that for each $x \in A$ there is an open set $U$ containing $x$ such that $U \subset A$. Show that $A$ is open in $X$.-/


```lean
theorem exercise_13_1 (X : Type*) [TopologicalSpace X] (A : Set X)
  (h1 : ∀ x ∈ A, ∃ U : Set X, x ∈ U ∧ IsOpen U ∧ U ⊆ A) :
  IsOpen A :=
```

## Statement 280
/-- Show that the collection $$\mathcal{T}_\infty = \{U | X - U \text{ is infinite or empty or all of X}\}$$ does not need to be a topology on the set $X$.-/


```lean
theorem exercise_13_3b : ¬ ∀ X : Type, ∀s : Set (Set X),
  (∀ t : Set X, t ∈ s → (Set.Infinite tᶜ ∨ t = ∅ ∨ t = ⊤)) →
  (Set.Infinite (⋃₀ s)ᶜ ∨ (⋃₀ s) = ∅ ∨ (⋃₀ s) = ⊤) :=
```

## Statement 281
/-- If $\mathcal{T}_\alpha$ is a family of topologies on $X$, show that $\bigcap \mathcal{T}_\alpha$ is a topology on $X$.-/


```lean
theorem exercise_13_4a1 (X I : Type*) (T : I → Set (Set X)) (h : ∀ i, is_topology X (T i)) :
  is_topology X (⋂ i : I, T i) :=
```

## Statement 282
/-- If $\mathcal{T}_\alpha$ is a family of topologies on $X$, show that $\bigcup \mathcal{T}_\alpha$ does not need to be a topology on $X$.-/


```lean
theorem exercise_13_4a2 :
  ∃ (X I : Type*) (T : I → Set (Set X)),
  (∀ i, is_topology X (T i)) ∧ ¬  is_topology X (⋂ i : I, T i) :=
```

## Statement 283
/-- Let $\mathcal{T}_\alpha$ be a family of topologies on $X$. Show that there is a unique smallest topology on $X$ containing all the collections $\mathcal{T}_\alpha$.-/


```lean
theorem exercise_13_4b1 (X I : Type*) (T : I → Set (Set X)) (h : ∀ i, is_topology X (T i)) :
  ∃! T', is_topology X T' ∧ (∀ i, T i ⊆ T') ∧
  ∀ T'', is_topology X T'' → (∀ i, T i ⊆ T'') → T'' ⊆ T' :=
```

## Statement 284
/-- Let $\mathcal{T}_\alpha$ be a family of topologies on $X$. Show that there is a unique largest topology on $X$ contained in all the collections $\mathcal{T}_\alpha$.-/


```lean
theorem exercise_13_4b2 (X I : Type*) (T : I → Set (Set X)) (h : ∀ i, is_topology X (T i)) :
  ∃! T', is_topology X T' ∧ (∀ i, T' ⊆ T i) ∧
  ∀ T'', is_topology X T'' → (∀ i, T'' ⊆ T i) → T' ⊆ T'' :=
```

## Statement 285
/-- Show that if $\mathcal{A}$ is a basis for a topology on $X$, then the topology generated by $\mathcal{A}$ equals the intersection of all topologies on $X$ that contain $\mathcal{A}$.-/


```lean
theorem exercise_13_5a {X : Type*}
  [TopologicalSpace X] (A : Set (Set X)) (hA : IsTopologicalBasis A) :
  generateFrom A = generateFrom (sInter {T | is_topology X T ∧ A ⊆ T}) :=
```

## Statement 286
/-- Show that if $\mathcal{A}$ is a subbasis for a topology on $X$, then the topology generated by $\mathcal{A}$ equals the intersection of all topologies on $X$ that contain $\mathcal{A}$.-/


```lean
theorem exercise_13_5b {X : Type*}
  [t : TopologicalSpace X] (A : Set (Set X)) (hA : t = generateFrom A) :
  generateFrom A = generateFrom (sInter {T | is_topology X T ∧ A ⊆ T}) :=
```

## Statement 287
/-- Show that the lower limit topology $\mathbb{R}_l$ and $K$-topology $\mathbb{R}_K$ are not comparable.-/


```lean
theorem exercise_13_6 :
  ¬ (∀ U, Rl.IsOpen U → K_topology.IsOpen U) ∧ ¬ (∀ U, K_topology.IsOpen U → Rl.IsOpen U) :=
```

## Statement 288
/-- Show that the collection $\{(a,b) \mid a < b, a \text{ and } b \text{ rational}\}$ is a basis that generates the standard topology on $\mathbb{R}$.-/


```lean
theorem exercise_13_8a :
  IsTopologicalBasis {S : Set ℝ | ∃ a b : ℚ, a < b ∧ S = Ioo ↑a ↑b} :=
```

## Statement 289
/-- Show that the collection $\{(a,b) \mid a < b, a \text{ and } b \text{ rational}\}$ is a basis that generates a topology different from the lower limit topology on $\mathbb{R}$.-/


```lean
theorem exercise_13_8b :
  (generateFrom {S : Set ℝ | ∃ a b : ℚ, a < b ∧ S = Ico ↑a ↑b}).IsOpen ≠
  (lower_limit_topology ℝ).IsOpen :=
```

## Statement 290
/-- Show that if $Y$ is a subspace of $X$, and $A$ is a subset of $Y$, then the topology $A$ inherits as a subspace of $Y$ is the same as the topology it inherits as a subspace of $X$.-/


```lean
theorem exercise_16_1 {X : Type*} [TopologicalSpace X]
  (Y : Set X)
  (A : Set Y) :
  ∀ U : Set A, IsOpen U ↔ IsOpen (Subtype.val '' U) :=
```

## Statement 291
/-- A map $f: X \rightarrow Y$ is said to be an open map if for every open set $U$ of $X$, the set $f(U)$ is open in $Y$. Show that $\pi_{1}: X \times Y \rightarrow X$ and $\pi_{2}: X \times Y \rightarrow Y$ are open maps.-/


```lean
theorem exercise_16_4 {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
  (π₁ : X × Y → X)
  (π₂ : X × Y → Y)
  (h₁ : π₁ = Prod.fst)
  (h₂ : π₂ = Prod.snd) :
  IsOpenMap π₁ ∧ IsOpenMap π₂ :=
```

## Statement 292
/-- Show that the countable collection \[\{(a, b) \times (c, d) \mid a < b \text{ and } c < d, \text{ and } a, b, c, d \text{ are rational}\}\] is a basis for $\mathbb{R}^2$.-/


```lean
theorem exercise_16_6
  (S : Set (Set (ℝ × ℝ)))
  (hS : ∀ s, s ∈ S → ∃ a b c d, (rational a ∧ rational b ∧ rational c ∧ rational d
  ∧ s = {x | ∃ x₁ x₂, x = (x₁, x₂) ∧ a < x₁ ∧ x₁ < b ∧ c < x₂ ∧ x₂ < d})) :
  IsTopologicalBasis S :=
```

## Statement 293
/-- Show that if $U$ is open in $X$ and $A$ is closed in $X$, then $U-A$ is open in $X$, and $A-U$ is closed in $X$.-/


```lean
theorem exercise_17_4 {X : Type*} [TopologicalSpace X]
  (U A : Set X) (hU : IsOpen U) (hA : IsClosed A) :
  IsOpen (U \ A) ∧ IsClosed (A \ U) :=
```

## Statement 294
/-- Let $Y$ be an ordered set in the order topology. Let $f, g: X \rightarrow Y$ be continuous. Show that the set $\{x \mid f(x) \leq g(x)\}$ is closed in $X$.-/


```lean
theorem exercise_18_8a {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
  [LinearOrder Y] [OrderTopology Y] {f g : X → Y}
  (hf : Continuous f) (hg : Continuous g) :
  IsClosed {x | f x ≤ g x} :=
```

## Statement 295
/-- Let $Y$ be an ordered set in the order topology. Let $f, g: X \rightarrow Y$ be continuous. Let $h: X \rightarrow Y$ be the function $h(x)=\min \{f(x), g(x)\}.$ Show that $h$ is continuous.-/


```lean
theorem exercise_18_8b {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
  [LinearOrder Y] [OrderTopology Y] {f g : X → Y}
  (hf : Continuous f) (hg : Continuous g) :
  Continuous (λ x => min (f x) (g x)) :=
```

## Statement 296
/-- Let $A \subset X$; let $f: A \rightarrow Y$ be continuous; let $Y$ be Hausdorff. Show that if $f$ may be extended to a continuous function $g: \bar{A} \rightarrow Y$, then $g$ is uniquely determined by $f$.-/


```lean
theorem exercise_18_13
  {X : Type*} [TopologicalSpace X] {Y : Type*} [TopologicalSpace Y]
  [T2Space Y] {A : Set X} {f : A → Y} (hf : Continuous f)
  (g : closure A → Y)
  (g_con : Continuous g) :
  ∀ (g' : closure A → Y), Continuous g' →  (∀ (x : closure A), g x = g' x) :=
```

## Statement 297
/-- Let $\mathbf{x}_1, \mathbf{x}_2, \ldots$ be a sequence of the points of the product space $\prod X_\alpha$.  Show that this sequence converges to the point $\mathbf{x}$ if and only if the sequence $\pi_\alpha(\mathbf{x}_i)$ converges to $\pi_\alpha(\mathbf{x})$ for each $\alpha$.-/


```lean
theorem exercise_19_6a
  {n : ℕ}
  {f : Fin n → Type*} {x : ℕ → Πa, f a}
  (y : Πi, f i)
  [Πa, TopologicalSpace (f a)] :
  Tendsto x atTop (𝓝 y) ↔ ∀ i, Tendsto (λ j => (x j) i) atTop (𝓝 (y i)) :=
```

## Statement 298
/-- Show that $\mathbb{R} \times \mathbb{R}$ in the dictionary order topology is metrizable.-/


```lean
theorem exercise_20_2
  [TopologicalSpace (ℝ ×ₗ ℝ)] [OrderTopology (ℝ ×ₗ ℝ)]
  : MetrizableSpace (ℝ ×ₗ ℝ) :=
```

## Statement 299
/-- Define $f_{n}:[0,1] \rightarrow \mathbb{R}$ by the equation $f_{n}(x)=x^{n}$. Show that the sequence $\left(f_{n}(x)\right)$ converges for each $x \in[0,1]$.-/


```lean
theorem exercise_21_6a
  (f : ℕ → I → ℝ )
  (h : ∀ x n, f n x = x ^ n) :
  ∀ x, ∃ y, Tendsto (λ n => f n x) atTop (𝓝 y) :=
```

## Statement 300
/-- Define $f_{n}:[0,1] \rightarrow \mathbb{R}$ by the equation $f_{n}(x)=x^{n}$. Show that the sequence $\left(f_{n}\right)$ does not converge uniformly.-/


```lean
theorem exercise_21_6b
  (f : ℕ → I → ℝ )
  (h : ∀ x n, f n x = x ^ n) :
  ¬ ∃ f₀, TendstoUniformly f f₀ atTop :=
```

## Statement 301
/-- Let $X$ be a topological space and let $Y$ be a metric space. Let $f_{n}: X \rightarrow Y$ be a sequence of continuous functions. Let $x_{n}$ be a sequence of points of $X$ converging to $x$. Show that if the sequence $\left(f_{n}\right)$ converges uniformly to $f$, then $\left(f_{n}\left(x_{n}\right)\right)$ converges to $f(x)$.-/


```lean
theorem exercise_21_8
  {X : Type*} [TopologicalSpace X] {Y : Type*} [MetricSpace Y]
  {f : ℕ → X → Y} {x : ℕ → X}
  (hf : ∀ n, Continuous (f n))
  (x₀ : X)
  (hx : Tendsto x atTop (𝓝 x₀))
  (f₀ : X → Y)
  (hh : TendstoUniformly f f₀ atTop) :
  Tendsto (λ n => f n (x n)) atTop (𝓝 (f₀ x₀)) :=
```

## Statement 302
/-- Let $p: X \rightarrow Y$ be a continuous map. Show that if there is a continuous map $f: Y \rightarrow X$ such that $p \circ f$ equals the identity map of $Y$, then $p$ is a quotient map.-/


```lean
theorem exercise_22_2a {X Y : Type*} [TopologicalSpace X]
  [TopologicalSpace Y] (p : X → Y) (h : Continuous p) :
  QuotientMap p ↔ ∃ (f : Y → X), Continuous f ∧ p ∘ f = id :=
```

## Statement 303
/-- If $A \subset X$, a retraction of $X$ onto $A$ is a continuous map $r: X \rightarrow A$ such that $r(a)=a$ for each $a \in A$. Show that a retraction is a quotient map.-/


```lean
theorem exercise_22_2b {X : Type*} [TopologicalSpace X]
  {A : Set X} (r : X → A) (hr : Continuous r) (h : ∀ x : A, r x = x) :
  QuotientMap r :=
```

## Statement 304
/-- Let $p \colon X \rightarrow Y$ be an open map. Show that if $A$ is open in $X$, then the map $q \colon A \rightarrow p(A)$ obtained by restricting $p$ is an open map.-/


```lean
theorem exercise_22_5 {X Y : Type*} [TopologicalSpace X]
  [TopologicalSpace Y] (p : X → Y) (hp : IsOpenMap p)
  (A : Set X) (hA : IsOpen A) : IsOpenMap (p ∘ Subtype.val : A → Y) :=
```

## Statement 305
/-- Let $\left\{A_{n}\right\}$ be a sequence of connected subspaces of $X$, such that $A_{n} \cap A_{n+1} \neq \varnothing$ for all $n$. Show that $\bigcup A_{n}$ is connected.-/


```lean
theorem exercise_23_2 {X : Type*}
  [TopologicalSpace X] {A : ℕ → Set X} (hA : ∀ n, IsConnected (A n))
  (hAn : ∀ n, A n ∩ A (n + 1) ≠ ∅) :
  IsConnected (⋃ n, A n) :=
```

## Statement 306
/-- Let $\left\{A_{\alpha}\right\}$ be a collection of connected subspaces of $X$; let $A$ be a connected subset of $X$. Show that if $A \cap A_{\alpha} \neq \varnothing$ for all $\alpha$, then $A \cup\left(\bigcup A_{\alpha}\right)$ is connected.-/


```lean
theorem exercise_23_3 {X : Type*} [TopologicalSpace X]
  [TopologicalSpace X] {A : ℕ → Set X}
  (hAn : ∀ n, IsConnected (A n))
  (A₀ : Set X)
  (hA : IsConnected A₀)
  (h : ∀ n, A₀ ∩ A n ≠ ∅) :
  IsConnected (A₀ ∪ (⋃ n, A n)) :=
```

## Statement 307
/-- Show that if $X$ is an infinite set, it is connected in the finite complement topology.-/


```lean
theorem exercise_23_4 {X : Type*} [TopologicalSpace X] [CofiniteTopology X]
  (s : Set X) : Infinite s → IsConnected s :=
```

## Statement 308
/-- Let $A \subset X$. Show that if $C$ is a connected subspace of $X$ that intersects both $A$ and $X-A$, then $C$ intersects $\operatorname{Bd} A$.-/


```lean
theorem exercise_23_6 {X : Type*}
  [TopologicalSpace X] {A C : Set X} (hc : IsConnected C)
  (hCA : C ∩ A ≠ ∅) (hCXA : C ∩ Aᶜ ≠ ∅) :
  C ∩ (frontier A) ≠ ∅ :=
```

## Statement 309
/-- Let $A$ be a proper subset of $X$, and let $B$ be a proper subset of $Y$. If $X$ and $Y$ are connected, show that $(X \times Y)-(A \times B)$ is connected.-/


```lean
theorem exercise_23_9 {X Y : Type*}
  [TopologicalSpace X] [TopologicalSpace Y]
  (A₁ A₂ : Set X)
  (B₁ B₂ : Set Y)
  (hA : A₁ ⊂ A₂)
  (hB : B₁ ⊂ B₂)
  (hA : IsConnected A₂)
  (hB : IsConnected B₂) :
  IsConnected ({x | ∃ a b, x = (a, b) ∧ a ∈ A₂ ∧ b ∈ B₂} \
      {x | ∃ a b, x = (a, b) ∧ a ∈ A₁ ∧ b ∈ B₁}) :=
```

## Statement 310
/-- Let $p: X \rightarrow Y$ be a quotient map. Show that if each set $p^{-1}(\{y\})$ is connected, and if $Y$ is connected, then $X$ is connected.-/


```lean
theorem exercise_23_11 {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
  (p : X → Y) (hq : QuotientMap p)
  (hY : ConnectedSpace Y) (hX : ∀ y : Y, IsConnected (p ⁻¹' {y})) :
  ConnectedSpace X :=
```

## Statement 311
/-- Let $f: S^{1} \rightarrow \mathbb{R}$ be a continuous map. Show there exists a point $x$ of $S^{1}$ such that $f(x)=f(-x)$.-/


```lean
theorem exercise_24_2 {f : (Metric.sphere 0 1 : Set ℝ) → ℝ}
  (hf : Continuous f) : ∃ x, f x = f (-x) :=
```

## Statement 312
/-- Let $f \colon X \rightarrow X$ be continuous. Show that if $X = [0, 1]$, there is a point $x$ such that $f(x) = x$. (The point $x$ is called a fixed point of $f$.)-/


```lean
theorem exercise_24_3a [TopologicalSpace I] [CompactSpace I]
  (f : I → I) (hf : Continuous f) :
  ∃ (x : I), f x = x :=
```

## Statement 313
/-- Let $X$ be locally path connected. Show that every connected open set in $X$ is path connected.-/


```lean
theorem exercise_25_4 {X : Type*} [TopologicalSpace X]
  [LocPathConnectedSpace X] (U : Set X) (hU : IsOpen U)
  (hcU : IsConnected U) : IsPathConnected U :=
```

## Statement 314
/-- Let $G$ be a topological group; let $C$ be the component of $G$ containing the identity element $e$. Show that $C$ is a normal subgroup of $G$.-/


```lean
theorem exercise_25_9 {G : Type*} [TopologicalSpace G] [Group G]
  [TopologicalGroup G] (C : Set G) (h : C = connectedComponent 1) :
  IsNormalSubgroup C :=
```

## Statement 315
/-- Let $X$ be a compact Hausdorff space. Let $\mathcal{A}$ be a collection of closed connected subsets of $X$ that is simply ordered by proper inclusion. Then $Y=\bigcap_{A \in \mathcal{A}} A$ is connected.-/


```lean
theorem exercise_26_11
  {X : Type*} [TopologicalSpace X] [CompactSpace X] [T2Space X]
  (A : Set (Set X)) (hA : ∀ (a b : Set X), a ∈ A → b ∈ A → a ⊆ b ∨ b ⊆ a)
  (hA' : ∀ a ∈ A, IsClosed a) (hA'' : ∀ a ∈ A, IsConnected a) :
  IsConnected (⋂₀ A) :=
```

## Statement 316
/-- Let $p: X \rightarrow Y$ be a closed continuous surjective map such that $p^{-1}(\{y\})$ is compact, for each $y \in Y$. (Such a map is called a perfect map.) Show that if $Y$ is compact, then $X$ is compact.-/


```lean
theorem exercise_26_12 {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]
  (p : X → Y) (h : Function.Surjective p) (hc : Continuous p) (hp : ∀ y, IsCompact (p ⁻¹' {y}))
  (hY : CompactSpace Y) : CompactSpace X :=
```

## Statement 317
/-- Show that a connected metric space having more than one point is uncountable.-/


```lean
theorem exercise_27_4
  {X : Type*} [MetricSpace X] [ConnectedSpace X] (hX : ∃ x y : X, x ≠ y) :
  ¬ Countable (univ : Set X) :=
```

## Statement 318
/-- A space $X$ is said to be countably compact if every countable open covering of $X$ contains a finite subcollection that covers $X$. Show that for a $T_1$ space $X$, countable compactness is equivalent to limit point compactness.-/


```lean
theorem exercise_28_4 {X : Type*}
  [TopologicalSpace X] (hT1 : T1Space X) :
  countably_compact X ↔ limit_point_compact X :=
```

## Statement 319
/-- Show that X is countably compact if and only if every nested sequence $C_1 \supset C_2 \supset \cdots$ of closed nonempty sets of X has a nonempty intersection.-/


```lean
theorem exercise_28_5
  (X : Type*) [TopologicalSpace X] :
  countably_compact X ↔ ∀ (C : ℕ → Set X), (∀ n, IsClosed (C n)) ∧
  (∀ n, C n ≠ ∅) ∧ (∀ n, C n ⊆ C (n + 1)) → ∃ x, ∀ n, x ∈ C n :=
```

## Statement 320
/-- Let $(X, d)$ be a metric space. If $f: X \rightarrow X$ satisfies the condition $d(f(x), f(y))=d(x, y)$ for all $x, y \in X$, then $f$ is called an isometry of $X$. Show that if $f$ is an isometry and $X$ is compact, then $f$ is bijective and hence a homeomorphism.-/


```lean
theorem exercise_28_6 {X : Type*} [MetricSpace X]
  [CompactSpace X] {f : X → X} (hf : Isometry f) :
  Function.Bijective f :=
```

## Statement 321
/-- Show that the rationals $\mathbb{Q}$ are not locally compact.-/


```lean
theorem exercise_29_1 : ¬ LocallyCompactSpace ℚ :=
```

## Statement 322
/-- Show that $[0, 1]^\omega$ is not locally compact in the uniform topology.-/


```lean
theorem exercise_29_4 [TopologicalSpace (ℕ → I)] :
  ¬ LocallyCompactSpace (ℕ → I) :=
```

## Statement 323
/-- Show that if $X$ is a Hausdorff space that is locally compact at the point $x$, then for each neighborhood $U$ of $x$, there is a neighborhood $V$ of $x$ such that $\bar{V}$ is compact and $\bar{V} \subset U$.-/


```lean
theorem exercise_29_10 {X : Type*}
  [TopologicalSpace X] [T2Space X] (x : X)
  (hx : ∃ U : Set X, x ∈ U ∧ IsOpen U ∧ (∃ K : Set X, U ⊂ K ∧ IsCompact K))
  (U : Set X) (hU : IsOpen U) (hxU : x ∈ U) :
  ∃ (V : Set X), IsOpen V ∧ x ∈ V ∧ IsCompact (closure V) ∧ closure V ⊆ U :=
```

## Statement 324
/-- Show that if $X$ is a countable product of spaces having countable dense subsets, then $X$ has a countable dense subset.-/


```lean
theorem exercise_30_10
  {X : ℕ → Type*} [∀ i, TopologicalSpace (X i)]
  (h : ∀ i, ∃ (s : Set (X i)), Countable s ∧ Dense s) :
  ∃ (s : Set (Π i, X i)), Countable s ∧ Dense s :=
```

## Statement 325
/-- Show that if $X$ has a countable dense subset, every collection of disjoint open sets in $X$ is countable.-/


```lean
theorem exercise_30_13 {X : Type*} [TopologicalSpace X]
  (h : ∃ (s : Set X), Countable s ∧ Dense s) (U : Set (Set X))
  (hU : ∀ (x y : Set X), x ∈ U → y ∈ U → x ≠ y → x ∩ y = ∅) :
  Countable U :=
```

## Statement 326
/-- Show that if $X$ is regular, every pair of points of $X$ have neighborhoods whose closures are disjoint.-/


```lean
theorem exercise_31_1 {X : Type*} [TopologicalSpace X]
  (hX : RegularSpace X) (x y : X) :
  ∃ (U V : Set X), IsOpen U ∧ IsOpen V ∧ x ∈ U ∧ y ∈ V ∧ closure U ∩ closure V = ∅ :=
```

## Statement 327
/-- Show that if $X$ is normal, every pair of disjoint closed sets have neighborhoods whose closures are disjoint.-/


```lean
theorem exercise_31_2 {X : Type*}
  [TopologicalSpace X] [NormalSpace X] {A B : Set X}
  (hA : IsClosed A) (hB : IsClosed B) (hAB : Disjoint A B) :
  ∃ (U V : Set X), IsOpen U ∧ IsOpen V ∧ A ⊆ U ∧ B ⊆ V ∧ closure U ∩ closure V = ∅ :=
```

## Statement 328
/-- Show that every order topology is regular.-/


```lean
theorem exercise_31_3 {α : Type*} [PartialOrder α]
  [TopologicalSpace α] (h : OrderTopology α) : RegularSpace α :=
```

## Statement 329
/-- Show that a closed subspace of a normal space is normal.-/


```lean
theorem exercise_32_1 {X : Type*} [TopologicalSpace X]
  (hX : NormalSpace X) (A : Set X) (hA : IsClosed A) :
  NormalSpace {x // x ∈ A} :=
```

## Statement 330
/-- Show that if $\prod X_\alpha$ is Hausdorff, then so is $X_\alpha$. Assume that each $X_\alpha$ is nonempty.-/


```lean
theorem exercise_32_2a
  {ι : Type*} {X : ι → Type*} [∀ i, TopologicalSpace (X i)]
  (h : ∀ i, Nonempty (X i)) (h2 : T2Space (Π i, X i)) :
  ∀ i, T2Space (X i) :=
```

## Statement 331
/-- Show that if $\prod X_\alpha$ is regular, then so is $X_\alpha$. Assume that each $X_\alpha$ is nonempty.-/


```lean
theorem exercise_32_2b
  {ι : Type*} {X : ι → Type*} [∀ i, TopologicalSpace (X i)]
  (h : ∀ i, Nonempty (X i)) (h2 : RegularSpace (Π i, X i)) :
  ∀ i, RegularSpace (X i) :=
```

## Statement 332
/-- Show that if $\prod X_\alpha$ is normal, then so is $X_\alpha$. Assume that each $X_\alpha$ is nonempty.-/


```lean
theorem exercise_32_2c
  {ι : Type*} {X : ι → Type*} [∀ i, TopologicalSpace (X i)]
  (h : ∀ i, Nonempty (X i)) (h2 : NormalSpace (Π i, X i)) :
  ∀ i, NormalSpace (X i) :=
```

## Statement 333
/-- Show that every locally compact Hausdorff space is regular.-/


```lean
theorem exercise_32_3 {X : Type*} [TopologicalSpace X]
  (hX : LocallyCompactSpace X) (hX' : T2Space X) :
  RegularSpace X :=
```

## Statement 334
/-- Show that every locally compact Hausdorff space is completely regular.-/


```lean
theorem exercise_33_7 {X : Type*} [TopologicalSpace X]
  (hX : LocallyCompactSpace X) (hX' : T2Space X) :
  ∀ x A, IsClosed A ∧ ¬ x ∈ A →
  ∃ (f : X → I), Continuous f ∧ f x = 1 ∧ f '' A = {0} :=
```

## Statement 335
/-- Let $X$ be completely regular, let $A$ and $B$ be disjoint closed subsets of $X$. Show that if $A$ is compact, there is a continuous function $f \colon X \rightarrow [0, 1]$ such that $f(A) = \{0\}$ and $f(B) = \{1\}$.-/


```lean
theorem exercise_33_8
  (X : Type*) [TopologicalSpace X] [RegularSpace X]
  (h : ∀ x A, IsClosed A ∧ ¬ x ∈ A →
  ∃ (f : X → I), Continuous f ∧ f x = (1 : I) ∧ f '' A = {0})
  (A B : Set X) (hA : IsClosed A) (hB : IsClosed B)
  (hAB : Disjoint A B)
  (hAc : IsCompact A) :
  ∃ (f : X → I), Continuous f ∧ f '' A = {0} ∧ f '' B = {1} :=
```

## Statement 336
/-- Let $X$ be a compact Hausdorff space that is the union of the closed subspaces $X_1$ and $X_2$. If $X_1$ and $X_2$ are metrizable, show that $X$ is metrizable.-/


```lean
theorem exercise_34_9
  (X : Type*) [TopologicalSpace X] [CompactSpace X]
  (X1 X2 : Set X) (hX1 : IsClosed X1) (hX2 : IsClosed X2)
  (hX : X1 ∪ X2 = univ) (hX1m : MetrizableSpace X1)
  (hX2m : MetrizableSpace X2) : MetrizableSpace X :=
```

## Statement 337
/-- Let $X$ be completely regular. Show that $X$ is connected if and only if the Stone-Čech compactification of $X$ is connected.-/


```lean
theorem exercise_38_6 {X : Type*}
  (X : Type*) [TopologicalSpace X] [RegularSpace X]
  (h : ∀ x A, IsClosed A ∧ ¬ x ∈ A →
  ∃ (f : X → I), Continuous f ∧ f x = (1 : I) ∧ f '' A = {0}) :
  IsConnected (univ : Set X) ↔ IsConnected (univ : Set (StoneCech X)) :=
```

## Statement 338
/-- Let $(X, d_X)$ and $(Y, d_Y)$ be metric spaces; let $Y$ be complete. Let $A \subset X$. Show that if $f \colon A \rightarrow Y$ is uniformly continuous, then $f$ can be uniquely extended to a continuous function $g \colon \bar{A} \rightarrow Y$, and $g$ is uniformly continuous.-/


```lean
theorem exercise_43_2 {X : Type*} [MetricSpace X]
  {Y : Type*} [MetricSpace Y] [CompleteSpace Y] (A : Set X)
  (f : X → Y) (hf : UniformContinuousOn f A) :
  ∃! (g : X → Y), ContinuousOn g (closure A) ∧
  UniformContinuousOn g (closure A) ∧ ∀ (x : A), g x = f x :=
```

## Statement 339
/-- For all odd $n$ show that $8 \mid n^{2}-1$.-/


```lean
theorem exercise_1_27 {n : ℕ} (hn : Odd n) : 8 ∣ (n^2 - 1) :=
```

## Statement 340
/-- Prove that $\frac{1}{2}+\frac{1}{3}+\cdots+\frac{1}{n}$ is not an integer.-/


```lean
theorem exercise_1_30 {n : ℕ} :
  ¬ ∃ a : ℤ, ∑ i : Fin n, (1 : ℚ) / (n+2) = a :=
```

## Statement 341
/-- Show that 2 is divisible by $(1+i)^{2}$ in $\mathbb{Z}[i]$.-/


```lean
theorem exercise_1_31  : (⟨1, 1⟩ : GaussianInt) ^ 2 ∣ 2 :=
```

## Statement 342
/-- If $a$ is a nonzero integer, then for $n>m$ show that $\left(a^{2^{n}}+1, a^{2^{m}}+1\right)=1$ or 2 depending on whether $a$ is odd or even.-/


```lean
theorem exercise_2_4 {a : ℤ} (ha : a ≠ 0)
  (f_a := λ n m : ℕ => Int.gcd (a^(2^n) + 1) (a^(2^m)+1)) {n m : ℕ}
  (hnm : n > m) :
  (Odd a → f_a n m = 1) ∧ (Even a → f_a n m = 2) :=
```

## Statement 343
/-- Define $\wedge(n)=\log p$ if $n$ is a power of $p$ and zero otherwise. Prove that $\sum_{A \mid n} \mu(n / d) \log d$ $=\wedge(n)$.-/


```lean
theorem exercise_2_21 {l : ℕ → ℝ}
  (hl : ∀ p n : ℕ, p.Prime → l (p^n) = log p )
  (hl1 : ∀ m : ℕ, ¬ IsPrimePow m → l m = 0) :
  l = λ n => ∑ d : Nat.divisors n, ArithmeticFunction.moebius (n/d) * log d :=
```

## Statement 344
/-- Show that $\sum^{\prime} 1 / n$, the sum being over square free integers, diverges.-/


```lean
theorem exercise_2_27a :
  ¬ Summable (λ i : {p : ℤ // Squarefree p} => (1 : ℚ) / i) :=
```

## Statement 345
/-- Show that there are infinitely many primes congruent to $-1$ modulo 6 .-/


```lean
theorem exercise_3_1 : Infinite {p : Nat.Primes // p ≡ -1 [ZMOD 6]} :=
```

## Statement 346
/-- Show that the equation $3 x^{2}+2=y^{2}$ has no solution in integers.-/


```lean
theorem exercise_3_4 : ¬ ∃ x y : ℤ, 3*x^2 + 2 = y^2 :=
```

## Statement 347
/-- Show that the equation $7 x^{3}+2=y^{3}$ has no solution in integers.-/


```lean
theorem exercise_3_5 : ¬ ∃ x y : ℤ, 7*x^3 + 2 = y^3 :=
```

## Statement 348
/-- If $n$ is not a prime, show that $(n-1) ! \equiv 0(n)$, except when $n=4$.-/


```lean
theorem exercise_3_10 {n : ℕ} (hn0 : ¬ n.Prime) (hn1 : n ≠ 4) :
  Nat.factorial (n-1) ≡ 0 [MOD n] :=
```

## Statement 349
/-- Let $p$ and $q$ be distinct odd primes such that $p-1$ divides $q-1$. If $(n, p q)=1$, show that $n^{q-1} \equiv 1(p q)$.-/


```lean
theorem exercise_3_14 {p q n : ℕ} (hp0 : p.Prime ∧ p > 2)
  (hq0 : q.Prime ∧ q > 2) (hpq0 : p ≠ q) (hpq1 : p - 1 ∣ q - 1)
  (hn : n.gcd (p*q) = 1) :
  n^(q-1) ≡ 1 [MOD p*q] :=
```

## Statement 350
/-- Consider a prime $p$ of the form $4 t+1$. Show that $a$ is a primitive root modulo $p$ iff $-a$ is a primitive root modulo $p$.-/


```lean
theorem exercise_4_4 {p t: ℕ} (hp0 : p.Prime) (hp1 : p = 4*t + 1)
  (a : ZMod p) :
  IsPrimitiveRoot a p ↔ IsPrimitiveRoot (-a) p :=
```

## Statement 351
/-- Consider a prime $p$ of the form $4 t+3$. Show that $a$ is a primitive root modulo $p$ iff $-a$ has order $(p-1) / 2$.-/


```lean
theorem exercise_4_5 {p t : ℕ} (hp0 : p.Prime) (hp1 : p = 4*t + 3)
  (a : ZMod p) :
  IsPrimitiveRoot a p ↔ ((-a) ^ ((p-1)/2) = 1 ∧ ∀ (k : ℕ), k < (p-1)/2 → (-a)^k ≠ 1) :=
```

## Statement 352
/-- If $p=2^{n}+1$ is a Fermat prime, show that 3 is a primitive root modulo $p$.-/


```lean
theorem exercise_4_6 {p n : ℕ} (hp : p.Prime) (hpn : p = 2^n + 1) :
  IsPrimitiveRoot 3 p :=
```

## Statement 353
/-- Let $p$ be an odd prime. Show that $a$ is a primitive root modulo $p$ iff $a^{(p-1) / q} \not \equiv 1(p)$ for all prime divisors $q$ of $p-1$.-/


```lean
theorem exercise_4_8 {p a : ℕ} (hp : Odd p) :
  IsPrimitiveRoot a p ↔ (∀ q : ℕ, q ∣ (p-1) → q.Prime → ¬ a^(p-1) ≡ 1 [MOD p]) :=
```

## Statement 354
/-- Prove that $1^{k}+2^{k}+\cdots+(p-1)^{k} \equiv 0(p)$ if $p-1 \nmid k$ and $-1(p)$ if $p-1 \mid k$.-/


```lean
theorem exercise_4_11 {p : ℕ} (hp : p.Prime) (k s: ℕ)
  (s := ∑ n : Fin p, (n : ℕ) ^ k) :
  ((¬ p - 1 ∣ k) → s ≡ 0 [MOD p]) ∧ (p - 1 ∣ k → s ≡ 0 [MOD p]) :=
```

## Statement 355
/-- Show that any prime divisor of $x^{4}-x^{2}+1$ is congruent to 1 modulo 12 .-/


```lean
theorem exercise_5_13 {p x: ℤ} (hp : Prime p)
  (hpx : p ∣ (x^4 - x^2 + 1)) : p ≡ 1 [ZMOD 12] :=
```

## Statement 356
/-- Show that $x^{4} \equiv 2(p)$ has a solution for $p \equiv 1(4)$ iff $p$ is of the form $A^{2}+64 B^{2}$.-/


```lean
theorem exercise_5_28 {p : ℕ} (hp : p.Prime) (hp1 : p ≡ 1 [MOD 4]):
  ∃ x, x^4 ≡ 2 [MOD p] ↔ ∃ A B, p = A^2 + 64*B^2 :=
```

## Statement 357
/-- Show that if $a$ is negative then $p \equiv q(4 a) together with p\not | a$ imply $(a / p)=(a / q)$.-/


```lean
theorem exercise_5_37 {p q : ℕ} [Fact (p.Prime)] [Fact (q.Prime)] {a : ℤ}
  (ha : a < 0) (h0 : p ≡ q [ZMOD 4*a]) (h1 : ¬ ((p : ℤ) ∣ a)) :
  legendreSym p a = legendreSym q a :=
```

## Statement 358
/-- Show that $\sin (\pi / 12)$ is an algebraic number.-/


```lean
theorem exercise_12_12 : IsAlgebraic ℚ (sin (Real.pi/12)) :=
```

## Statement 359
/-- Show that 1729 is the smallest positive integer expressible as the sum of two different integral cubes in two ways.-/


```lean
theorem exercise_18_4 {n : ℕ} (hn : ∃ x y z w : ℤ,
  x^3 + y^3 = n ∧ z^3 + w^3 = n ∧ x ≠ z ∧ x ≠ w ∧ y ≠ z ∧ y ≠ w) :
  n ≥ 1729 :=
```

## Statement 360
/-- For $j \in\{1,2,3,4\}$, let $z_{j}$ be a complex number with $\left|z_{j}\right|=1$ and $z_{j} \neq 1$. Prove that $3-z_{1}-z_{2}-z_{3}-z_{4}+z_{1} z_{2} z_{3} z_{4} \neq 0 .$-/


```lean
theorem exercise_2020_b5 (z : Fin 4 → ℂ) (hz0 : ∀ n, ‖z n‖ < 1)
  (hz1 : ∀ n : Fin 4, z n ≠ 1) :
  3 - z 0 - z 1 - z 2 - z 3 + (z 0) * (z 1) * (z 2) * (z 3) ≠ 0 :=
```

## Statement 361
/-- Let $f: \mathbb{R} \rightarrow \mathbb{R}$ be an infinitely differentiable function satisfying $f(0)=0, f(1)=1$, and $f(x) \geq 0$ for all $x \in$ $\mathbb{R}$. Show that there exist a positive integer $n$ and a real number $x$ such that $f^{(n)}(x)<0$.-/


```lean
theorem exercise_2018_a5 (f : ℝ → ℝ) (hf : ContDiff ℝ ⊤ f)
  (hf0 : f 0 = 0) (hf1 : f 1 = 1) (hf2 : ∀ x, f x ≥ 0) :
  ∃ (n : ℕ) (x : ℝ), iteratedDeriv n f x = 0 :=
```

## Statement 362
/-- Let $n$ be a positive integer, and let $f_{n}(z)=n+(n-1) z+$ $(n-2) z^{2}+\cdots+z^{n-1}$. Prove that $f_{n}$ has no roots in the closed unit disk $\{z \in \mathbb{C}:|z| \leq 1\}$.-/


```lean
theorem exercise_2018_b2 (n : ℕ) (hn : n > 0) (f : ℕ → ℂ → ℂ)
  (hf : ∀ n : ℕ, f n = λ (z : ℂ) => (∑ i : Fin n, (n-i)* z^(i : ℕ))) :
  ¬ (∃ z : ℂ, ‖z‖ ≤ 1 ∧ f n z = 0) :=
```

## Statement 363
/-- Given a real number $a$, we define a sequence by $x_{0}=1$, $x_{1}=x_{2}=a$, and $x_{n+1}=2 x_{n} x_{n-1}-x_{n-2}$ for $n \geq 2$. Prove that if $x_{n}=0$ for some $n$, then the sequence is periodic.-/


```lean
theorem exercise_2018_b4 (a : ℝ) (x : ℕ → ℝ) (hx0 : x 0 = a)
  (hx1 : x 1 = a)
  (hxn : ∀ n : ℕ, n ≥ 2 → x (n+1) = 2*(x n)*(x (n-1)) - x (n-2))
  (h : ∃ n, x n = 0) :
  ∃ c, Function.Periodic x c :=
```

## Statement 364
/-- Suppose that $f(x)=\sum_{i=0}^{\infty} c_{i} x^{i}$ is a power series for which each coefficient $c_{i}$ is 0 or 1 . Show that if $f(2 / 3)=3 / 2$, then $f(1 / 2)$ must be irrational.-/


```lean
theorem exercise_2017_b3 (f : ℝ → ℝ) (c : ℕ → ℝ)
  (hf : f = λ x => (∑' (i : ℕ), (c i) * x^i))
  (hc : ∀ n, c n = 0 ∨ c n = 1)
  (hf1 : f (2/3) = 3/2) :
  Irrational (f (1/2)) :=
```

## Statement 365
/-- Let-/


```lean
theorem exercise_2014_a5 (P : ℕ → Polynomial ℤ)
  (hP : ∀ n, P n = ∑ i : Fin n, (n+1) * Polynomial.X ^ n) :
  ∀ (j k : ℕ), j ≠ k → IsCoprime (P j) (P k) :=
```

## Statement 366
/-- Prove that for each positive integer $n$, the number $10^{10^{10^n}}+10^{10^n}+10^n-1$ is not prime.-/


```lean
theorem exercise_2010_a4 (n : ℕ) :
  ¬ Nat.Prime (10^10^10^n + 10^10^n + 10^n - 1) :=
```

## Statement 367
/-- Prove that there are unique positive integers $a, n$ such that $a^{n+1}-(a+1)^n=2001$.-/


```lean
theorem exercise_2001_a5 :
  ∃! a : ℕ, ∃! n : ℕ, a > 0 ∧ n > 0 ∧ a^(n+1) - (a+1)^n = 2001 :=
```

## Statement 368
/-- Prove that there exist infinitely many integers $n$ such that $n, n+1, n+2$ are each the sum of the squares of two integers.-/


```lean
theorem exercise_2000_a2 :
  ∀ N : ℕ, ∃ n : ℕ, n > N ∧ ∃ i : Fin 6 → ℕ, n = (i 0)^2 + (i 1)^2 ∧
  n + 1 = (i 2)^2 + (i 3)^2 ∧ n + 2 = (i 4)^2 + (i 5)^2 :=
```

## Statement 369
/-- Let $f$ be a real function with a continuous third derivative such that $f(x), f^{\prime}(x), f^{\prime \prime}(x), f^{\prime \prime \prime}(x)$ are positive for all $x$. Suppose that $f^{\prime \prime \prime}(x) \leq f(x)$ for all $x$. Show that $f^{\prime}(x)<2 f(x)$ for all $x$.-/


```lean
theorem exercise_1999_b4 (f : ℝ → ℝ) (hf: ContDiff ℝ 3 f)
  (hf1 : ∀ n ≤ 3, ∀ x : ℝ, iteratedDeriv n f x > 0)
  (hf2 : ∀ x : ℝ, iteratedDeriv 3 f x ≤ f x) :
  ∀ x : ℝ, deriv f x < 2 * f x :=
```

## Statement 370
/-- Let $f$ be a real function on the real line with continuous third derivative. Prove that there exists a point $a$ such that-/


```lean
theorem exercise_1998_a3 (f : ℝ → ℝ) (hf : ContDiff ℝ 3 f) :
  ∃ a : ℝ, (f a) * (deriv f a) * (iteratedDeriv 2 f a) * (iteratedDeriv 3 f a) ≥ 0 :=
```

## Statement 371
/-- Prove that, for any integers $a, b, c$, there exists a positive integer $n$ such that $\sqrt{n^3+a n^2+b n+c}$ is not an integer.-/


```lean
theorem exercise_1998_b6 (a b c : ℤ) :
  ∃ n : ℤ, n > 0 ∧ ¬ ∃ m : ℤ, Real.sqrt (n^3 + a*n^2 + b*n + c) = m :=
```

