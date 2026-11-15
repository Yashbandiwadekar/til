# Nash Equilibrium via the Prisoner's Dilemma

**What:** A Nash equilibrium is a set of strategies where no player gains by
changing only their own choice while everyone else keeps theirs. The
Prisoner's Dilemma shows that this stable point can be worse for everyone than
cooperating.

**Why it matters:** Blockchain incentives are designed so that honest
behaviour is the equilibrium. Rewards and slashing make deviating unprofitable.

## Details

Payoffs are years in prison, so lower is better:

| Al / Bill | Confess | Deny |
|---|---|---|
| Confess | (3, 3) | (1, 10) |
| Deny | (10, 1) | (2, 2) |

Best-response check for Al:
- If Bill denies, confessing gives 1 and denying gives 2, so Al confesses.
- If Bill confesses, confessing gives 3 and denying gives 10, so Al confesses.

So confessing is a dominant strategy, and by symmetry it's dominant for Bill
too. The only equilibrium is (Confess, Confess) at (3, 3), even though
(Deny, Deny) at (2, 2) is better for both. Each player is rational, yet the
outcome is worse for both.

Contrast: a zero-sum game (odd-even finger game) has payoffs that always sum to
0, so cooperation can't help. The Prisoner's Dilemma isn't zero-sum.

## Source

MLBC Unit 4 (game theory) notes.
