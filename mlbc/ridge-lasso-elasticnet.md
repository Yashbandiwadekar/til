# Ridge, Lasso, and Elastic Net Regression

**What:** Three ways to regularize linear regression by penalizing large
coefficients. **Ridge (L2)** shrinks coefficients toward zero but never
*to* zero. **Lasso (L1)** can shrink a coefficient all the way to zero,
which removes that feature entirely. **Elastic Net** combines both
penalties, each with its own separate lambda.

**Why it matters:** "Ridge shrinks, Lasso selects" is the one-line answer to
almost every question comparing the three.

## Details

```
Ridge:   loss = RSS + lambda * sum(beta_i^2)
Lasso:   loss = RSS + lambda * sum(|beta_i|)
Elastic: loss = RSS + lambda1 * sum(|beta_i|) + lambda2 * sum(beta_i^2)
```

Worked example from the notes — Lasso applied to
`y = 0.9 + 1.2*x1 + 20*x2 + 39*x3` zeroes out the two smaller coefficients
entirely:
```
y = 0.9 + 0*x1 + 0*x2 + 5*x3
```
Ridge on the same model would shrink all three coefficients but never zero
any of them out — that's the whole difference in one example.

Use Ridge when most features are actually useful (handles multicollinearity,
keeps everything). Use Lasso when the model has a lot of useless variables
(gives a sparse, interpretable model, but unstable when features are
correlated with each other). Use Elastic Net when you don't know in advance
which case you're in.

## Source

MLBC Unit 2 notes (Regularization of Linear Regression).
