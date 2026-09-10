# Bagging vs Boosting

**What:** Two ensemble strategies. **Bagging** trains many models
independently, in parallel, on different random subsets of the data, then
votes or averages (Random Forest). **Boosting** trains models sequentially,
where each new model specifically targets the previous one's mistakes
(AdaBoost, Gradient Boosting).

**Why it matters:** This one distinction — parallel/independent vs
sequential/corrective — is the answer key to nearly every comparison question
between Random Forest, AdaBoost, and Gradient Boosting.

## Details

- **Random Forest (bagging):** many full trees, built independently on
  bootstrap samples + random feature subsets, combined by majority vote.
  Mainly reduces **variance**. Easy to parallelize.
- **AdaBoost (boosting):** starts every sample with equal weight, then after
  each weak learner (often a stump), *increases the weight* of whatever it
  got wrong so the next learner focuses there. Final prediction is a
  **weighted** vote. Mainly reduces **bias**, but is sensitive to noisy data
  because it keeps up-weighting outliers too.
- **Gradient Boosting:** instead of reweighting samples, each new tree is
  trained to predict the **residual error** left by all the trees before it.
  Final prediction is the sum of every tree's output.

Analogy that made it click: a student re-sitting a test — attempt 1 scores
60/100, they study only the mistakes, attempt 2 scores 80/100, study the
*remaining* mistakes, attempt 3 scores 95/100. Each pass corrects what's left
over, which is exactly what boosting does with each new tree.

## Source

MLBC Unit 2 notes + AdaBoost / Gradient Boosting worked-example decks.
