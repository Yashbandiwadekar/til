# How Blocks Are Linked, and Why That Beats a Central Ledger

**What:** Each block stores its data, its own hash and the hash of the previous
block (the genesis block uses previous hash 0000), so the blocks form a chain.
Every node keeps a copy of that chain; no bank or server owns it.

**Why it matters:** "What is blockchain, how are blocks linked, centralised vs
decentralised" is a standard opening question, and the tamper-evidence argument
is the part that earns the marks.

## Details

A block's hash is computed over its data **and** its previous-hash field. I
checked this with SHA-256 on the class example (Phil, Sam, Ted each pay Jack 2 BTC):

```
Block 1  prev 0000      hash 585fefd7
Block 2  prev 585fefd7  hash 67202d56
Block 3  prev 67202d56  hash ab635042
```
Edit Block 2 (2 BTC -> 20 BTC) and its hash becomes `beff33bf`, but Block 3 still
stores `67202d56`, so the link is broken. To hide it the attacker must recompute
every later block (with its proof of work) on most nodes.

| | Centralised | Decentralised |
|---|---|---|
| Control | one authority owns the ledger | shared by all nodes |
| Failure | single point of failure (server down, account hacked) | other nodes carry on |
| Trust | trust the owner | trust consensus + cryptography |
| Example | bank database | Bitcoin, Ethereum |

Class example: Phil pays Jack 2 BTC. Via a bank it fails if the server is down or a
limit is hit; on a blockchain all four friends validate it and update their own copy.

## Source
MLBC Unit IV class slides (Phil/Ted/Sam/Jack ledger example, hash-chain slides);
MLBC Assignment 2. Hashes computed with Python `hashlib`.
