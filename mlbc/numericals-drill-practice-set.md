# MLBC Numericals Drill: One Recipe and One Self-Test Per Question Type

**What:** A step recipe for every numerical type the MLBC end-sem has set (or is likely to set), each with a fresh practice question and its answer, ML and blockchain both. All numbers come from a script.

**Why it matters:** Numericals came in May 24 (25 marks) and Dec 25 (30 marks), and K-means came word for word both times. I knew the theory but had never solved one under time pressure. These are the self-tests I made so I'd stop just reading the solutions. Each one uses her method where her method differs from the textbook (multi-way CART, 1/0-vote AdaBoost, PCA projecting raw points, no Naive Bayes smoothing).

## Details

Cover the answer line, solve on paper, then check. The worked past-paper versions are in the end-sem booklets.

### K-means, one dimension (k = 2)

- **Asked:** May 24 Q3b and Dec 25 Q2b, word for word, 10 marks each.
- **Recipe:** Write the data and k. State your start: 'take the first two values as C1, C2'. → For every x, write |x − C1| and |x − C2| in a table; put x in the nearer cluster. → New centroid = sum of members ÷ number of members (show 'sum/size'). → Repeat 2–3 with the new centroids. Stop when no point changes cluster. → Box the final clusters and centroids.
- **Formulas:** d = |x − c| (1-D)     centroid = mean of members
- **Practice:** Cluster {5, 9, 1, 16, 22, 3, 18, 25} into k = 2, starting from C1 = 5, C2 = 9. Show each iteration.
- **Answer:** Iter-1 distances (|x − C1|, |x − C2|): 5 (0, 4); 9 (4, 0); 1 (4, 8); 16 (11, 7); 22 (17, 13); 3 (2, 6); 18 (13, 9); 25 (20, 16); Iter 1 (C = 5, 9): K1 = {5, 1, 3}, K2 = {9, 16, 22, 18, 25} → new C = 9/3 = 3, 90/5 = 18; Iter 2 (C = 3, 18): K1 = {5, 9, 1, 3}, K2 = {16, 22, 18, 25} → new C = 18/4 = 4.5, 81/4 = 20.25; Iter 3 (C = 4.5, 20.25): K1 = {5, 9, 1, 3}, K2 = {16, 22, 18, 25} → new C = 18/4 = 4.5, 81/4 = 20.25  ← no change, stop.; Final: {1, 3, 5, 9} → 4.5;  {16, 18, 22, 25} → 20.25.

### Confusion matrix: accuracy, precision, recall, F1

- **Asked:** May 24 Q1b (5 marks) and Dec 25 Q3a (10 marks).
- **Recipe:** Draw the 2 × 2 matrix: rows = actual, columns = predicted; place TP, FN / FP, TN. → N = TP + TN + FP + FN. → Write each formula, substitute, give the fraction, then 4 decimals. → F1 by the shortcut 2TP/(2TP + FP + FN) (no rounding error); check with 2PR/(P + R). → One line: accuracy hides imbalance; precision = cost of false alarms, recall = cost of misses.
- **Formulas:** Acc = (TP + TN)/N   P = TP/(TP + FP)   R = TP/(TP + FN)   F1 = 2TP/(2TP + FP + FN)
- **Practice:** TP = 40, FP = 8, TN = 45, FN = 7. Find accuracy, precision, recall and F1.
- **Answer:** N = 100; accuracy 85/100 = 0.8500; precision 40/48 = 0.8333; recall 40/47 = 0.8511; F1 80/95 = 0.8421.

### Naive Bayes classification from a table

- **Asked:** May 24 Q2b (10 marks, stolen cars). Theory version verbatim in Dec 24 Q2b and Dec 25 Q3b: add this example.
- **Recipe:** Count rows per class → priors P(Yes), P(No). → For each feature value in the new example, count it INSIDE each class → P(value | class). → Score(class) = prior × all its likelihoods (drop the common denominator). → Larger score wins. Optional: divide each score by their sum to get probabilities. → If a count is 0, the score is 0 (her method has no smoothing; mention Laplace as the textbook fix).
- **Formulas:** score(Y) = P(Y) × Π P(Xᵢ | Y)
- **Practice:** Study, Sleep → Pass?  1 High, Good, Yes · 2 High, Poor, Yes · 3 Low, Good, Yes · 4 High, Good, Yes · 5 Low, Poor, No · 6 High, Poor, No · 7 Low, Poor, No · 8 Low, Good, Yes. Classify (Study = High, Sleep = Poor).
- **Answer:** Yes: 5/8 × 3/5 × 1/5 = 3/40 = 0.075;  No: 3/8 × 1/3 × 3/3 = 1/8 = 0.125 → **No (fail)**.

### PCA on 2-D data (her method)

- **Asked:** PCA asked in 4/5 papers, so far as theory; her worked example (Unit 2 slides 12–21) is the likely numerical.
- **Recipe:** Means x̄, ȳ (her 'standardise' step only shows the means; do not divide by sd). → Table of x − x̄, y − ȳ, their squares and product; sum each column. → C = [Σdx²  Σdxdy ; Σdxdy  Σdy²] ÷ (n − 1). → Solve λ² − (trace)λ + det = 0 → two eigenvalues. → For the LARGEST λ: (cxx − λ)a + cxy·b = 0 → b/a; take a = 1, divide by √(1 + (b/a)²) → PC1. → % kept = λ(big) ÷ (λ(big) + λ(small)). → Her transform: score = x·PC1ₓ + y·PC1ᵧ on the RAW point.
- **Formulas:** cov = Σ(x − x̄)(y − ȳ)/(n − 1)   |C − λI| = 0   (C − λI)v = 0   % = λ/Σλ
- **Practice:** Points (1, 2), (2, 3), (3, 5), (4, 4), (5, 6). Find C, both eigenvalues, PC1, the % of variance kept and the PC1 score of every point (her method).
- **Answer:** x̄ = 3, ȳ = 4; C = [2.5  2.25 ; 2.25  2.5]; λ = 4.75 and 0.25; PC1 = [0.7071, 0.7071]; kept 95%; scores 2.1213, 3.5355, 5.6569, 5.6569, 7.7782.

### Decision tree with CART / Gini (her multi-way split)

- **Asked:** Dec 25 Q4b (10 marks), the only tree numerical so far; she taught two full examples.
- **Recipe:** Gini(S) of the whole table: 1 − (p(yes)² + p(no)²). → For each attribute, split one branch per value; count Yes/No in each branch; Gini of each branch. → Weighted Gini = Σ (branch rows ÷ all rows) × branch Gini. Put all attributes in one table. → Root = attribute with the SMALLEST weighted Gini. → Pure branches become leaves; repeat steps 2–4 inside impure branches only. → Draw the tree; check it classifies every training row.
- **Formulas:** Gini = 1 − Σp²   weighted Gini = Σ (|Sᵥ|/|S|) Gini(Sᵥ)
- **Practice:** Weather, Homework → Play?  1 Sunny, Done, Yes · 2 Sunny, Pending, No · 3 Cloudy, Done, Yes · 4 Rainy, Done, No · 5 Cloudy, Pending, Yes · 6 Rainy, Pending, No · 7 Sunny, Done, Yes · 8 Cloudy, Done, Yes. Build the CART tree (her multi-way method).
- **Answer:** Gini(S) = 0.4688; Gini(Weather) = 0.1667, Gini(Homework) = 0.3667 → root **Weather**. Cloudy → Yes, Rainy → No; Sunny (2Y 1N) split by Homework (weighted Gini 0): Done → Yes, Pending → No.

### Decision tree with entropy / information gain (ID3)

- **Asked:** Not set yet; her PlayTennis example is the model. Dec 25 Q4b can also be cross-checked this way.
- **Recipe:** Entropy(S) = −p₊log₂p₊ − p₋log₂p₋ for the whole table. → For each attribute and each value: count +/−, entropy of that branch. → Gain = Entropy(S) − Σ (branch rows ÷ all rows) × branch entropy. → Root = LARGEST gain; recurse inside impure branches; pure branch (entropy 0) = leaf.
- **Formulas:** E = −Σ p log₂ p   Gain = E(S) − Σ (|Sᵥ|/|S|) E(Sᵥ)   (log₂ p = ln p / ln 2)
- **Practice:** Use the Weather/Homework table from D5. Find Entropy(S), Gain(Weather) and Gain(Homework). Which is the ID3 root?
- **Answer:** Entropy(S) = 0.9544; Gain(Weather) = 0.6101; Gain(Homework) = 0.1589 → root **Weather** (same as CART here).

### AdaBoost: one round of weights + final score (her method)

- **Asked:** AdaBoost short note May 24 Q6a; ensembles in May 25 Q5a, May 26 Q4b. Her Adaboost Eg deck is the model numerical.
- **Recipe:** Start every row at w = 1/N. → Run the stump; mark wrong rows. ε = sum of the wrong rows' weights. → α = ½ ln((1 − ε)/ε).  (ε = 0: α undefined, skip; ε > 0.5: α negative, keep it — her way.) → Right rows: w × e^(−α); wrong rows: w × e^(+α). Z = sum of these. → Divide each by Z (check they add to 1). Use them for the next stump. → Final score of a row = Σ α over the stumps, with vote 1 for Yes and 0 for No; positive → Yes.
- **Formulas:** ε = Σ w_wrong   α = ½ ln((1 − ε)/ε)   w_new = w e^(∓α)/Z   H = Σ α·h,  h ∈ {1, 0}
- **Practice:** (a) 8 rows, equal weights. A stump gets rows 3 and 6 wrong. Find ε, α, Z and the new weights.  (b) Three stumps have α = 0.42, 0.65, −0.3 and vote 1, 0, 1 (1 = Yes) for a row. Final score and prediction?
- **Answer:** (a) w₀ = 0.125; ε = 0.25; α = 0.5493; Z = 0.8660; right rows → 0.0833, wrong rows → 0.2500.  (b) 0.42 + (−0.3) = 0.12 > 0 → Yes.

### Least-squares line (fit, predict, MSE)

- **Asked:** Not set as a numerical yet; it is the base of the Ridge/Lasso questions (5/5 papers).
- **Recipe:** Means x̄ and ȳ. → Columns x − x̄, y − ȳ, their product, (x − x̄)²; sum the last two. → m = Σ product ÷ Σ square;  b = ȳ − m·x̄. → Predict ŷ = m·x + b. → Residuals y − ŷ → SSE → MSE = SSE/n (and R² = 1 − SSE/SST if asked).
- **Formulas:** m = Σ(x − x̄)(y − ȳ)/Σ(x − x̄)²   b = ȳ − m x̄   MSE = Σ(y − ŷ)²/n
- **Practice:** x = 1, 2, 3, 4, 5; y = 2, 4, 5, 4, 5. Fit the line, predict y at x = 6, and find SSE and MSE.
- **Answer:** x̄ = 3, ȳ = 4; Σ product = 6, Σ square = 10; m = 0.6, b = 2.2; ŷ(6) = 5.8; SSE = 2.4, MSE = 0.48.

### Ridge / Lasso effect on a slope (and gradient boosting residuals)

- **Asked:** Ridge/Lasso: 5/5 papers as theory; a 'what happens as λ grows' calculation strengthens a 10-mark answer. Gradient boosting: her salary example.
- **Recipe:** Ridge/Lasso (one input, centred, intercept not penalised): → Get Sxx = Σ(x − x̄)² and Sxy = Σ(x − x̄)(y − ȳ). → Ridge slope = Sxy/(Sxx + λ): shrinks, never 0. → Lasso slope = (Sxy − λ/2)/Sxx; once that is ≤ 0 the slope is exactly 0 (λ ≥ 2·Sxy). → Gradient boosting: 1. F₀ = mean y. 2. residual = y − F₀. 3. new F = F₀ + rate × tree output. 4. new residual = y − new F.
- **Formulas:** Ridge β = Sxy/(Sxx + λ)   Lasso β = max(0, (Sxy − λ/2)/Sxx)   F_new = F + lr × tree(r)
- **Practice:** (a) Data of D8 (Sxx = 10, Sxy = 6). Ridge slope at λ = 5? Lasso slope at λ = 4? Smallest λ that makes the Lasso slope 0?  (b) Salaries 40, 60, 80k; tree outputs −18, 1, 17; learning rate 0.1. New predictions and residuals?
- **Answer:** (a) plain slope 0.6; Ridge(5) = 0.4; Lasso(4) = 0.4; Lasso hits 0 at λ = 12 (Ridge at λ = 100 is still 0.0545).  (b) F₀ = 60; new predictions 58.2, 60.1, 61.7; residuals −18.2, −0.1, 18.3.

### Feature scaling: min-max and z-score

- **Asked:** May 25 Q2a ≈ Dec 25 Q2a (10 marks, 'with examples'); part of May 26 Q2a.
- **Recipe:** Min-max: find min and max; x′ = (x − min)/(max − min) for each value. → z-score: mean; sd = √(Σ(x − mean)²/n) (say 'population sd'); z = (x − mean)/sd. → Check: min-max gives 0 and 1 at the ends; z-scores add to 0.
- **Formulas:** x′ = (x − min)/(max − min)   z = (x − mean)/sd
- **Practice:** Scale 4, 8, 10, 14, 24 both ways.
- **Answer:** min-max 0, 0.2, 0.3, 0.5, 1; mean 12, population sd 6.8118; z −1.1744, −0.5872, −0.2936, 0.2936, 1.7617 (with sample sd 7.6158 instead, say so).

### Merkle root and Merkle proof

- **Asked:** Merkle tree in 4/5 papers (Dec 24 Q1b is 'Merkle proof'). No hash arithmetic asked; the proof size and path are the numerical part.
- **Recipe:** Hash every transaction: H1 … Hn. → Pair neighbours and hash the joined pair: H12 = H(H1 ‖ H2), … → Odd one out: carry it up unpaired (her rule) or duplicate it (Bitcoin). → Repeat until one hash is left: the Merkle root. → Proof for a transaction = the sibling hash at every level on its path; size = log₂ n for n a power of 2. → Verifier rebuilds the root from the transaction + proof and compares it with the header.
- **Formulas:** parent = H(left ‖ right)   proof size = log₂ n
- **Practice:** (a) Which hashes prove Tx6 in an 8-transaction tree? (b) Proof size for 16 transactions? (c) With her carry-up rule and 6 transactions, how many hashes prove Tx1 and Tx5?
- **Answer:** (a) H5, H78, H1234  (b) 4  (c) Tx1: H2, H34, H56 (3); Tx5: H6, H1234 (2). Levels: {H1, H2, H3, H4, H5, H6} → {H12, H34, H56} → {H1234, H56} → {H123456}.

### Proof of Work: nonce search and difficulty

- **Asked:** May 24 Q4a ('how can a hash indicate PoW?'); PoW appears in 5/5 papers.
- **Recipe:** Fix the block data; set nonce = 0. → Hash (data + nonce). Does it start with the required zeros (is it below the target)? → No → nonce + 1 and repeat. Yes → broadcast; others check with ONE hash. → Expected tries for k leading hex zeros = 16ᵏ. → Retarget (her slide): every 2016 blocks, aiming at 10 min per block = 14 days; too fast → harder, too slow → easier.
- **Formulas:** hash(header ‖ nonce) < target   expected tries = 16ᵏ   new difficulty ≈ old × 14/actual days
- **Practice:** (a) Expected tries for 2 and for 4 leading hex zeros?  (b) 2016 blocks took 16 days: new difficulty?  (c) Block reward after the next halving from 3.125 BTC?
- **Answer:** (a) 256 and 65,536  (b) × 0.875 (easier)  (c) 1.5625 BTC. (Script check for (a): 'Jack pays Phil 1 BTC | nonce=' first reaches 2 zeros at nonce 455.)

### Proof of Stake: selection probability

- **Asked:** PoS in 5/5 papers (Dec 24 Q4b, May 26 Q3b …) as theory; the numbers support the 'raffle ticket' and 'rich get richer' points.
- **Recipe:** Add all stakes. → Each validator's chance = its stake ÷ total. → Expected blocks = chance × blocks. → Attack check: does anyone (or a group) hold MORE than 50% of the stake?
- **Formulas:** P(i) = stakeᵢ / Σ stake
- **Practice:** Stakes P 500, Q 300, R 150, S 50. Chance for each? Can P alone attack the chain? Can P and S together?
- **Answer:** 0.5, 0.3, 0.15, 0.05. P has exactly 0.5 of the stake, not a majority: no. P + S = 550 of 1000 = 0.55 > 0.5: yes.

### PoET wait times and Byzantine fault tolerance

- **Asked:** PoET: every consensus comparison (5/5). BFT: Byzantine Generals, May 26 Q6e.
- **Recipe:** PoET: 1. wait = random × mean wait for each node. 2. Smallest wait wins and shows its certificate. → BFT: 1. Need n ≥ 3f + 1. 2. Max traitors f = ⌊(n − 1)/3⌋.
- **Formulas:** wait = random(0, 1) × mean   n ≥ 3f + 1
- **Practice:** (a) Mean wait 8 s; nodes draw 0.31, 0.07, 0.66. Wait times and winner?  (b) How many traitors can 12 and 13 nodes tolerate?
- **Answer:** (a) 2.48, 0.56, 5.28 s → node B wins.  (b) 12 → 3, 13 → 4.

### SHA-256 padding

- **Asked:** Hash functions in 3/5 papers; the padding steps are her slides 52–58 (a likely 'explain SHA-256' part).
- **Recipe:** l = message length in bits (8 bits per character). → Append one 1 bit. → k = (448 − l − 1) mod 512 zero bits. → Append the 64-bit length. Total = l + 1 + k + 64 = a multiple of 512. → Blocks = total ÷ 512.
- **Formulas:** l + 1 + k ≡ 448 (mod 512)
- **Practice:** Find k, the total length and the number of blocks for l = 440 and for l = 448.
- **Answer:** l = 440: k = 7, 512 bits, 1 block.  l = 448: k = 511, 1024 bits, 2 blocks (448 itself leaves no room for the 1 and the length).

### Reading a payoff matrix (Nash) and counting keys

- **Asked:** Nash / Prisoner's Dilemma: May 25 Q3b, Dec 25 Q6b, May 26 Q1e. Key counting supports Dec 24 Q5a (symmetric encryption).
- **Recipe:** Nash: 1. Fix player 2's column; circle player 1's best reply in it. 2. Fix player 1's row; circle player 2's best reply. → A cell with both circled = Nash equilibrium. (Prison years: smaller is better; profits: bigger is better.) → Keys: symmetric n(n − 1)/2, asymmetric 2n.
- **Formulas:** best reply in each row/column   n(n − 1)/2   2n
- **Practice:** (a) Two miners choose Honest or Cheat. Profits: (H, H) = (6, 6), (H, C) = (4, 3), (C, H) = (3, 4), (C, C) = (1, 1). Find the Nash equilibrium.  (b) Keys needed for 100 users, symmetric vs asymmetric?
- **Answer:** (a) (Honest, Honest): each player's best reply to Honest is Honest (6 > 3) and to Cheat is Honest (4 > 1). This is how blockchain rewards make honesty the equilibrium.  (b) 4,950 vs 200.

## Source

Her Unit 2 slides (PCA, Naive Bayes, Ridge/Lasso, K-means), Decision Tree Example, Adaboost Eg, Gradient Boosting Eg, Unit 4 (SHA-256, Merkle, game theory, Byzantine Generals) and Unit 5 (PoW, PoS, PoET) notes; the five end-sem papers May 2024 to May 2026. Practice data is mine. PoS stake/total, 16^k expected tries, the retarget ratio, the n(n-1)/2 key count, precision/recall/F1 and z-score are general knowledge, not in her notes. Numbers verified by expand_compute.py in my end-sem prep folder.
