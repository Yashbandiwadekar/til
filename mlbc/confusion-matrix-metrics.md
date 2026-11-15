# Accuracy, Precision, Recall and F1 from a Confusion Matrix

**What:** Four numbers computed from TP, TN, FP and FN that say how good a
classifier is. Accuracy is overall correctness; precision and recall look only
at the positive class; F1 is the harmonic mean of precision and recall.

**Why it matters:** It's the cheapest numerical in the MLBC paper: given four
counts, all four metrics take a few minutes. It isn't in the Unit 2 slides
(the syllabus lists it as self-learning), so I learned the formulas separately.

## Details

| Metric | Formula | Question it answers |
|---|---|---|
| Accuracy | (TP + TN) / total | How many predictions were right? |
| Precision | TP / (TP + FP) | Of what I called positive, how much was? |
| Recall | TP / (TP + FN) | Of the real positives, how many did I find? |
| F1 | 2PR / (P + R) = 2TP / (2TP + FP + FN) | Balance of the two |

Worked (TP 30, FP 10, TN 20, FN 15, total 75):
accuracy 50/75 = 0.6667, precision 30/40 = 0.75, recall 30/45 = 0.6667,
F1 = 60/85 = 0.7059.

The `2TP / (2TP + FP + FN)` form avoids rounding errors from using an already
rounded P and R.

When to care: precision when false alarms are costly (spam filter), recall when
misses are costly (disease screening). Accuracy hides class imbalance.

## Source

End-sem PYQ practice for MLBC (values checked with a Python script).
