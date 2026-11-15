# Linear Regression: Residuals, MSE and the Best-Fit Line

**What:** Linear regression picks the line `y = mx + b` whose squared errors
(residuals) add up to the smallest possible number. That sum, or its average
(MSE), is the cost function; "best fit" just means "lowest cost".

**Why it matters:** Ridge, Lasso and ElasticNet (asked in every MLBC paper) are
this same cost with a penalty bolted on. If "residual" and "cost" don't click,
regularisation never will.

## Details

Toy data, four houses (size in 1000 sq ft, price in lakh):
(1, 20), (2, 40), (3, 50), (4, 70).

- **Residual** = actual − predicted (vertical gap from the dot to the line).
- **MSE** = (1/n) Σ (y − ŷ)². Squaring stops +3 and −3 cancelling and
  punishes big misses harder (a miss of 10 costs 100, a miss of 1 costs 1).

Scoring two lines:

| Line | Residuals | SSE | MSE |
|---|---|---|---|
| guess: ŷ = 20x | 0, 0, −10, −10 | 200 | 50 |
| best: ŷ = 5 + 16x | −1, 3, −3, 1 | 20 | 5 |

Least squares gives the best line directly:

```
m = Σ(x − x̄)(y − ȳ) / Σ(x − x̄)²      b = ȳ − m·x̄
x̄ = 2.5, ȳ = 45
Σ(x − x̄)(y − ȳ) = 37.5 + 2.5 + 2.5 + 37.5 = 80
Σ(x − x̄)²       = 2.25 + 0.25 + 0.25 + 2.25 = 5
m = 80/5 = 16,  b = 45 − 16 × 2.5 = 5
```

Fit check: RMSE = √5 ≈ 2.24 lakh, MAE = 2, R² = 1 − 20/1300 ≈ 0.985.

Plot cost against slope and you get a bowl with its bottom at m = 16.
Gradient descent just rolls down that bowl when there's no neat formula
(Lasso, neural nets).

## Where overfitting comes in

A degree-7 polynomial through 8 noisy points gets train MSE 0. On new
points its test MSE is about 1.0, against about 0.02 for a straight line.
To wiggle that much its coefficients blow up (the largest is about 25,000).
Large weights are the symptom that a penalty fixes. See
[regularisation-penalty-intuition](regularisation-penalty-intuition.md).

Her own data (experience 1–5 → salary 3–7 lakh) is exactly y = x + 2, so its
MSE is 0. Real data is never that clean.

## Source

MLBC Unit 2 notes (linear regression slides 22–34; her salary example on
slide 26). Toy numbers are from my own Easy Guide script (`compute_easy.py`).
