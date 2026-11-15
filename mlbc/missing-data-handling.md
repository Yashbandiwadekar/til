# Handling Missing Data

**What:** Missing values are either removed (deleting rows or columns) or
filled in (imputation) before training, because most models can't take empty
cells.

**Why it matters:** The pick depends on how much is missing and why.
Exam questions ask for the trade-offs, not only the list.

## Details

| Technique | When | Upside | Downside |
|---|---|---|---|
| Delete rows | a few rows missing (5 of 10,000) | simple, nothing invented | loses data; biased if not random |
| Mean imputation | many rows missing a numeric column | keeps rows | shrinks variance, ignores correlations |
| Median / mode | skewed numbers / categories | robust to outliers | same distortion |
| Forward / back fill | time series | keeps trend | wrong over long gaps |
| Model-based (KNN, regression) | important column | most accurate | slower, can overfit |
| Drop the column | column mostly empty | removes noise | loses a feature |

Related preprocessing steps:
- Label encoding is only for ordered categories (Small, Medium, Large).
- One-hot encoding is for unordered ones (Red, Green, Blue), so the model
  doesn't think Blue = 3 x Red.

## Source

MLBC Unit 1 (deletion, mean imputation) plus textbook for the other rows.
