# PoW vs PoS vs PoET: Work, Stake, Wait

**What:** Three ways a blockchain decides who adds the next block: prove work
done (PoW), prove coins locked (PoS), or prove a random wait was served (PoET).

**Why it matters:** The syllabus asks for working, energy use and limitations of
all three, so I need one comparison I can write in 10 points.

## Details

| | PoW | PoS | PoET |
|---|---|---|---|
| Picks the block creator by | first to find a hash below the target | stake (plus randomness) | shortest random wait time |
| Resource | hardware + electricity | locked coins (32 ETH on Ethereum) | trusted hardware (Intel SGX) |
| Energy | very high | very low (Ethereum reported about 99.95% less after the 2022 Merge) | very low |
| Attack | 51% of hash power | large share of stake, and the attacker loses stake (slashing) | break the SGX enclave |
| Example | Bitcoin | Ethereum today, Cardano | Hyperledger Sawtooth |
| Main limitation | energy, mining-pool concentration, slow (Bitcoin about 10 min blocks) | rich get richer | trust in Intel, SGX vulnerabilities, mostly permissioned |

Mnemonic: Work, Stake, Wait. All three exist because of the Byzantine Generals'
Problem: nodes must agree despite faulty ones (needs n >= 3f + 1 for BFT-style protocols).

## Source
MLBC Unit V (Consensus Mechanism), IAE-2 question bank (Module 5 Q1). The Ethereum
and PoET/Sawtooth points were checked against web sources.
