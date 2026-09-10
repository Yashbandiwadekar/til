# PCA: Compressing Correlated Features

**What:** Principal Component Analysis converts a large number of correlated
features into a smaller number of uncorrelated "principal components" that
preserve most of the original variance.

**Why it matters:** It's the standard fix for too many correlated features
confusing a model — but it only captures *linear* relationships, and the
resulting components aren't directly interpretable anymore (they're
combinations of the originals, not real-world quantities).

## Details

Steps:
1. Standardize the dataset (mean 0, variance 1) so no feature dominates
   purely because of its scale.
2. Compute the covariance matrix.
3. Find its eigenvalues and eigenvectors.
4. Sort by eigenvalue, descending.
5. Keep the top-k components.
6. Project the original data onto them.

The two terms that always get confused: the **eigenvalue** tells you how
much variance (information) a component captures; the **eigenvector** tells
you the *direction* of that component. Bigger eigenvalue = more important
component.

Concrete example: a university tracking Maths, Physics, and Chemistry marks
(highly correlated) can combine all three into one component — call it
"Academic Performance" — instead of storing them separately.

## Source

MLBC Unit 2 notes (Principal Component Analysis).
