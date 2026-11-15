# PCA Worked End to End (Her 10-Point Example)

**What:** A full 2-D PCA by hand: means, covariance matrix, eigenvalues from
`|C − λI| = 0`, a unit eigenvector, then each point projected onto PC1. It
follows her method, which projects the raw points. The textbook subtracts
the mean first.

**Why it matters:** PCA was asked in 4 of 5 papers. The steps list
([pca-dimensionality-reduction](pca-dimensionality-reduction.md)) only sticks
once you've pushed real numbers through it.

## Details

Intuition first: PCA picks the camera angle that gives the longest shadow.
Variance is spread, and spread is information. The eigenvector is the
direction of that shadow, and the eigenvalue is how long it is.

Data: X = 2.5, 0.5, 2.2, 1.9, 3.1, 2.3, 2.0, 1.0, 1.5, 1.1;
Y = 2.4, 0.7, 2.9, 2.2, 3.0, 2.7, 1.6, 1.1, 1.6, 0.9.

```
means            x̄ = 1.81, ȳ = 1.91
Σ(x−x̄)² = 5.549   Σ(y−ȳ)² = 6.449   Σ(x−x̄)(y−ȳ) = 5.539     (divide by n−1 = 9)
C = [0.6166 0.6154; 0.6154 0.7166]
λ² − 1.3331λ + 0.0630 = 0  →  λ = (1.3331 ± 1.2349)/2 = 1.2840, 0.0491
λ = 1.2840: −0.6674x + 0.6154y = 0 → y = 1.0845x → (1, 1.0845)/1.4752
PC1 = [0.6779, 0.7352]          share kept = 1.2840/1.3331 = 96.3%
PC2 = [−0.7352, 0.6779]         (from x = −1.0845y)
```

Projection, her way (raw point · PC1): (2.5, 2.4) → 3.459, (0.5, 0.7) → 0.854,
(2.2, 2.9) → 3.623. Her slides show 3.45, 0.85 and 3.62.
Textbook way ((point − mean) · PC1): 0.828, −1.778, 0.992. The pattern and
spread are identical; the scores are just shifted.

Variance check: var(X) = 0.6166, var(Y) = 0.7166, var(PC1) = 1.2840,
var(PC2) = 0.0491. The total (1.3331) is preserved. PCA only moves it into
PC1.

## Gotchas specific to her slides

- The covariance still uses the deviations from the mean. Only the final
  projection is raw.
- "Standardise" is only a heading in her example. Her Step 3 slide shows
  the means and nothing else. Nothing is divided by the standard deviation:
  if it were, the diagonal of C would be 1, not 0.6166 and 0.7166.
- She labels the *small* eigenvalue λ1 (0.0490) and the big one λ2. Always
  keep the largest.
- Her PC1 [0.6778, 0.7351] is the exact [0.6779, 0.7352] truncated.

## Source

MLBC Unit 2 notes (PCA, slides 7–21). Every value was recomputed with numpy
in my Easy Guide script and cross-checked against the 36-hour pack's
`compute_output.txt`.
