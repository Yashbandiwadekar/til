# Why a Penalty Shrinks Weights, and Why Only Lasso Hits Zero

**What:** Regularisation minimises `error + λ × (size of the weights)`, so the
model only keeps a big weight if it buys a lot of accuracy. With Ridge's
squared penalty, weights shrink but never reach 0. Lasso's absolute-value
penalty can push a weight to exactly 0.

**Why it matters:** It's the "why" behind the one-liner "Ridge shrinks, Lasso
selects" (see [ridge-lasso-elasticnet](ridge-lasso-elasticnet.md)). With one
worked number you can defend that line in a 10-mark answer.

## Details

Analogy: λ is a leash. λ = 0 means no leash (plain least squares, chases
noise). A huge λ pins every weight near 0 (underfit). Cross-validation picks
something in between.

**Why the answer changes:** take the house toy data (best plain slope 16)
with a Ridge cost of `SSE + 20 × slope²`:

| Slope | SSE | Penalty | Total |
|---|---|---|---|
| 16 (plain) | 20 | 5120 | 5140 |
| 3.2 (Ridge) | 839.2 | 204.8 | 1044 |

The worse-fitting slope wins because its fine is tiny.

**One feature, centred data, intercept not penalised.** Here
Σ(x − x̄)(y − ȳ) = 80 and Σ(x − x̄)² = 5:

```
Ridge  slope = 80 / (5 + λ)
Lasso  slope = max(80 − λ/2, 0) / 5
ElasticNet slope = max(80 − λ1/2, 0) / (5 + λ2)
```

| λ | Ridge | Lasso |
|---|---|---|
| 0 | 16 | 16 |
| 20 | 3.2 | 14 |
| 80 | 0.94 | 8 |
| 160 | 0.48 | **0** |

Lasso is exactly 0 for any λ ≥ 160. Ridge only approaches 0. ElasticNet with
λ1 = 40 and λ2 = 5 gives (80 − 20)/10 = 6: the L1 part subtracts and the L2
part divides.

**The geometric picture:** for two weights, Ridge's budget
(w1² + w2² ≤ t) is a circle and Lasso's (|w1| + |w2| ≤ t) is a diamond. The
error contours usually touch the diamond at a corner, and at a corner one
weight is 0. A circle has no corners.

## Source

MLBC Unit 2 notes (regularisation slides 35–51: the need for regularisation,
bias/variance, her 1.2/20/39 → 0/0/5 Lasso example). The closed forms were
checked by brute-force grid search in my Easy Guide script.
