# Decision Tree Splitting Criteria

**What:** Entropy, Information Gain, and Gini Index are the three measures a
decision tree uses to decide which feature to split on next. ID3 picks the
split with the **highest** Information Gain; CART picks the split with the
**lowest** Gini Index.

**Why it matters:** Mixing up "maximize" and "minimize" between the two
families is an easy way to lose marks on an otherwise-correct numerical.

## Details

**Entropy** — impurity of a set. Pure node (all one class) → 0. Perfectly
mixed → highest.
```
H(S) = -sum( p_i * log2(p_i) )
```

**Information Gain** — how much entropy a split removes. The feature with the
highest IG is chosen.
```
IG = H(parent) - sum( weighted H(children) )
```

**Gini Index** — a different impurity measure, cheaper to compute (no log).
Lower Gini = purer split = better.
```
Gini = 1 - sum( p_i^2 )
```

Same dataset, two different textbook worked examples: one solved with
entropy/IG (ID3), one with Gini (CART) — same tree, different arithmetic path
to get there.

## Source

MLBC Unit 2 notes + Decision Tree ID3 / Gini worked-example decks.
