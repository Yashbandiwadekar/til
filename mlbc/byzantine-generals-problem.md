# Byzantine Generals' Problem

**What:** Separated generals must agree on one plan (attack or retreat) using
only messengers, while some generals may be traitors sending conflicting
orders. It's the model for nodes in a peer-to-peer network that must agree on
one ledger despite faulty or malicious peers.

**Why it matters:** Every consensus protocol is a fix for this problem. The
`3f + 1` bound and Nakamoto consensus are the two facts worth memorising.

## Details

- Lamport, Shostak and Pease, 1982.
- With plain messages, agreement needs `n >= 3f + 1` nodes to tolerate f
  traitors (fewer than a third faulty). So 3 generals can't tolerate even 1.
- Byzantine faults: lying, delaying messages, not responding.
- Mapping: generals = nodes, traitors = malicious nodes,
  messengers = unreliable network, plan = next block.
- Bitcoin's answer is Nakamoto consensus (2008 white paper): Proof of Work
  makes proposals costly to create and cheap to verify, and everyone follows
  the longest chain. An attacker needs over 50% of the hash power.
- Permissioned chains use PBFT, which has the same 3f + 1 bound.

## Source

MLBC Unit 4 notes (Byzantine Generals section).
