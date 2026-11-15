# Gradient Boosting: Learning the Residuals

**What:** Gradient boosting starts from a base prediction (the mean), then
each new tree is trained on the residuals (actual minus predicted) of the model
so far. Each tree's output is added after it's scaled by a learning rate.

**Why it matters:** It's the cleanest way to tell it apart from AdaBoost.
AdaBoost re-weights the rows; gradient boosting fits the errors directly.

## Details

1. Base model `F0 = mean(y)`.
2. Residuals `r = y - F`.
3. Fit a tree to `(x, r)`.
4. `F_new = F + lr * tree(x)`.
5. Repeat on the new residuals. Final model `F(x) = sum alpha_i h_i(x)`.

Salary example: salaries 50k, 70k, 80k, 100k, so base = 75k and
residuals = -25, -5, 5, 25. The tree predicts -23, -3, 3, 20.
- With lr = 1 the first row jumps to 52k, which overfits.
- With lr = 0.01 the predictions are 74.77, 74.97, 75.03, 75.2 and the new
  residuals are -24.77, -4.97, 4.97, 24.8.

Small steps and many trees are what make it generalise.

## Source

MLBC Unit 2 gradient boosting worked example, rechecked with Python.
