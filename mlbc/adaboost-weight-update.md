# AdaBoost: The Weight-Update Loop

**What:** AdaBoost trains weak learners (decision stumps) one after another.
Each round it measures the stump's weighted error, gives the stump a say
(alpha), and re-weights the rows so the misclassified ones count more next time.

**Why it matters:** The numerical is a fixed recipe of five formulas. Once the
recipe is in hand, every round is mechanical.

## Details

Start: every row gets weight 1/N.

Per stump:
1. `eps = sum of weights of misclassified rows`
2. `alpha = 0.5 * ln((1 - eps) / eps)`
3. `Z = sum(w * e^-alpha over correct) + sum(w * e^+alpha over wrong)`
4. new weight = `w * e^-alpha / Z` (correct) or `w * e^+alpha / Z` (wrong)
5. final score `H(d) = sum alpha_i * h_i(d)`

Six-row job-profile example, stump 1 (CGPA >= 9 -> Yes) misclassifies 2 rows:
eps = 2/6 = 0.3333, alpha = 0.3466, Z = 0.9428, correct rows -> 0.125,
wrong rows -> 0.25 (weights still sum to 1). Stump 2 then has eps = 0.25,
alpha = 0.5493.

Edge cases I tripped on:
- eps = 0 (stump is perfect) makes alpha infinite, so skip that stump or stop.
- eps > 0.5 gives a negative alpha, so the stump's vote counts against it.
  The class example keeps that; textbooks usually discard such learners.
- The slides use 1/0 votes for h(d), but the textbook uses +1/-1 and the sign of H.

## Source

MLBC Unit 2 (ensemble learning) AdaBoost worked example, rechecked with Python.
