# Normalisation vs Standardisation

**What:** Both are feature scaling. Normalisation (min-max) squeezes values
into [0, 1]. Standardisation (z-score) shifts values to mean 0 and standard
deviation 1.

**Why it matters:** Features on large ranges (salary in lakhs vs age in
years) dominate distance-based and gradient-based models. It also came up as a
10-mark question in consecutive papers.

## Details

| | Normalisation | Standardisation |
|---|---|---|
| Formula | (x - min) / (max - min) | (x - mean) / sd |
| Range | 0 to 1 | unbounded, mean 0, sd 1 |
| Outliers | one outlier squashes the rest | less sensitive |
| Use | bounded data, pixels, KNN, neural nets | roughly normal data, SVM, PCA, linear/logistic regression |

Example [10, 20, 30, 40, 50]:
- min-max gives 0, 0.25, 0.5, 0.75, 1
- z-score (mean 30, population sd 14.142) gives -1.414, -0.707, 0, 0.707, 1.414

Age 30 on an 18-80 range normalises to 0.1935.

The class notes only define normalisation; the z-score side came from a
standard textbook.

## Source

MLBC Unit 1 (data preprocessing) plus textbook; values checked with Python.
