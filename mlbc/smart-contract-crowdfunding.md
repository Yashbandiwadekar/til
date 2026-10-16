# Smart Contract Example: Crowdfunding (Kickstarter Logic)

**What:** A smart contract is code on the blockchain that runs automatically when
its conditions are met ("if this, then that"). The crowdfunding contract holds the
money until a deadline, then either pays the creator or refunds the backers.

**Why it matters:** "Explain a smart contract with a practical example and one
challenge" needs a worked example; the Kickstarter analogy from class maps to about
30 lines of Solidity.

## Details

Flow: deploy with a goal and deadline -> `pledge()` sends ETH to the contract -> after
the deadline: `raised >= goal` then `claim()` pays the creator, else `refund()` returns
each pledge. Nobody can change these rules or stop the code.

How it works: write and compile -> deploy (gets an address) -> a user calls a function in
a transaction and pays gas -> every node runs it -> the state change is recorded in a block.

I compiled my version with solc-js 0.8.26: 0 errors, 0 warnings. Two details that
matter: `claimed` stops the creator claiming twice, and `refund()` sets the pledge to
zero **before** sending ETH (checks-effects-interactions), which avoids re-entrancy.
A Python simulation of the same logic gave: goal met -> creator paid, refund reverts;
goal missed -> claim reverts, backer refunded.

**Challenge:** a deployed contract is immutable, so a bug stays forever (2016 DAO hack,
a re-entrancy bug). Workaround: deploy a new contract and move users to it; audit first.

## Source
MLBC Unit V (smart contracts, Kickstarter analogy, immutability downside);
MLBC Assignment 2 (contract compiled and simulated by me).
