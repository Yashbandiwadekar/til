# K-Means Clustering

**What:** An unsupervised algorithm that partitions data into K clusters. Every
point is assigned to whichever centroid it's nearest to, then each centroid is
recomputed as the mean of its assigned points, and the two steps repeat until
nothing moves.

**Why it matters:** It's the one clustering algorithm guaranteed to show up as
a full numerical, and the *method* is what's graded, not the final answer.
Show the distance table, not just the clusters.

## Details

Distance: `d(p1, p2) = sqrt((x2-x1)^2 + (y2-y1)^2)`

Per iteration:
1. **Assign** — compute distance from every point to every current centroid,
   assign each point to its nearest one.
2. **Update** — recompute each centroid as the mean of the points now in it.
3. Repeat until the assignment column stops changing between iterations —
   that's convergence, not a fixed number of iterations.

Worked trace (K=3, points A1(2,10) A2(2,5) A3(8,4) B1(5,8) B2(7,5) B3(6,4)
C1(1,2) C2(4,9), starting centroids A1/B1/C1):

| Iter | Centroids | What moved |
|---|---|---|
| 1 | (2,10) (5,8) (1,2) | C2 was closer to A1's group than expected |
| 2 | (2,10) (6,6) (1.5,3.5) | C2 flips into cluster 1 |
| 3 | (3,9.5) (6.5,5.25) (1.5,3.5) | B1 flips into cluster 1 |
| 4 | (3.67,9) (7,4.33) (1.5,3.5) | no change → converged |

Final: {A1, B1, C2}, {A3, B2, B3}, {A2, C1}.

## Source

MLBC Unit 2 notes, K-Means worked example (IAE-1 prep).
