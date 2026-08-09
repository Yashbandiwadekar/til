# Why automated containment needs a human gate

**What:** In automated incident response, not all response actions carry the same
risk if the detection was a false positive. The design principle: **split actions
by the cost of being wrong**, and only auto-run the ones where being wrong is
cheap.

**Why it matters:** The instinct is to automate everything for speed. But an
automated action on a false positive can cause more damage than the attack you
were worried about — and detections *will* false-positive. Getting this split
right is what makes automation safe enough to actually enable.

## Details

The asymmetry, concretely:

| Action | If it was a false positive | Decision |
|---|---|---|
| Collect forensic evidence (read-only) | Wasted some disk. That's it. | **Auto-run** |
| Isolate the host (disruptive) | You took a production machine offline for nothing | **Require human approval** |
| Delete files / re-image (destructive) | Irreversible damage | **Never automate** — recommend only |

Two subtleties I learned building this:

1. **An unanswered approval must default to *no action*, not action.** If nobody
   responds, isolating the host an hour later is a surprise outage. "No decision"
   ≠ "yes."

2. **Fail closed.** If the system can't gather the context needed to justify a
   disruptive action (e.g., the enrichment query fails), it should *skip* the
   action, not proceed blindly.

There's also a blast-radius guard: if the same detection fires across many hosts
at once, that's either a real outbreak *or* a broken rule — and mass automated
isolation is the wrong answer to both. So wide firing forces a human in the loop
regardless.

## Source

Designing the containment gate in my SIEM/EDR/DFIR automation project. The gate
logic has dedicated tests proving each of these properties holds.
