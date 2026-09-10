# Naive Bayes: Which Variant for Which Data

**What:** Bernoulli, Multinomial, and Gaussian Naive Bayes differ only in
what kind of feature they expect — the classification logic (Bayes' theorem
+ the independence assumption) is identical across all three.

**Why it matters:** Picking the wrong variant for the data type is the most
common mistake — e.g. using Gaussian NB on word-count data, or Multinomial NB
on continuous sensor readings.

## Details

| Variant | Feature type | Typical use |
|---|---|---|
| Bernoulli | Binary (0/1, present/absent) | Spam detection from "contains word X?" flags |
| Multinomial | Counts / frequencies | Text classification, using how *often* a word appears |
| Gaussian | Continuous, assumed normal | Medical/sensor data — height, weight, blood pressure |

All three share the same weakness: they assume every feature is independent
of the others given the class, which is rarely true, but the models still
tend to perform well in practice anyway.

## Source

MLBC Unit 2 notes (Naive Bayes, Bayes' Theorem).
