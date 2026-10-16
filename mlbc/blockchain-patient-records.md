# Blockchain for Patient Records: Hash On-Chain, Data Off-Chain

**What:** Health records are stored encrypted off-chain; the blockchain holds only the
record's hash, a pointer, the access rules (a smart contract) and an audit log. The
patient holds the key and decides who may read.

**Why it matters:** It is the standard healthcare answer (Unit VI use case 1) and it
comes with a natural privacy question: how do you keep immutable data compatible with
the right to erasure?

## Details

1. Hospital encrypts the record, stores it off-chain, writes hash + pointer on-chain.
2. Patient grants or revokes access for doctors, labs and insurers via a smart contract.
3. A doctor requests access; the contract checks permission and logs it.
4. Doctor fetches the file, recomputes the hash, compares with the on-chain hash.

Step 4 works as expected: re-hashing the unchanged sample record matched the stored
SHA-256, and changing one value (HbA1c 7.9 -> 5.9) produced a different hash, so
tampering is detected.

Benefits: full history across providers (fewer mistakes), patient control, audit trail,
no single database to breach. **Privacy concern:** the chain cannot delete data but laws
such as GDPR (and India's DPDP Act, 2023) give a right to erasure/correction, so no
personal data goes on-chain; keep files off-chain and salt each record before hashing so
the hash cannot be guessed.

## Source
MLBC Unit VI class slides (healthcare use cases); MLBC Assignment 2.
