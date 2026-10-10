# Merkle Tree: Building the Root and Proving a Transaction

**What:** A Merkle tree hashes transactions in pairs, level by level, until one
hash (the Merkle root) is left; that root goes in the block header.

**Why it matters:** "Construct a Merkle tree for 4 transactions" is a near-certain
exam question, and the proof step (why you only need log2(n) hashes) is the part
people skip.

## Details

For Tx1..Tx4 with hash `H` (Bitcoin uses double SHA-256) and `+` meaning concatenation:
```
H1 = H(Tx1)   H2 = H(Tx2)   H3 = H(Tx3)   H4 = H(Tx4)
H12 = H(H1 + H2)            H34 = H(H3 + H4)
Merkle root = H(H12 + H34)
```
- Change any one transaction (say Tx3) and H3, H34 and the root all change, so
  tampering is visible from the root alone.
- **Merkle proof for Tx3:** give H4 and H12. The verifier computes H3, then
  `H34 = H(H3 + H4)`, then `H(H12 + H34)` and compares with the root in the
  header. That is 2 = log2(4) hashes instead of all 4 transactions, which is
  how light clients verify a payment without downloading the block.
- If a level has an odd number of nodes, Bitcoin duplicates the last hash to
  make a pair.

## Source
MLBC Unit IV (Introduction to Blockchain), IAE-2 question bank (Q2 and Q9).
