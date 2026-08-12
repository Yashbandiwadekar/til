# Phishing Awareness Demo

**What:** How to demonstrate phishing *without* building a credential harvester —
and the specific red flags that make a look-alike login page detectable.

**Why it matters:** The interesting lesson wasn't "phishing is bad," it was a
design/ethics one: an awareness demo should be **non-functional as an attack
tool** on purpose. Making it harvest nothing both keeps it from being misused and
makes the teaching point land harder — the "gotcha" reveal is the payload, not
the stolen password.

## Details

**The safe demo pattern** (what I built):
- Bind to **`127.0.0.1` only**, never `0.0.0.0` — not reachable off the box.
- **Discard credentials.** Don't store, log, or transmit them. To prove "an
  attacker would now have this" I showed only a **masked username + password
  length** (e.g. `al*** / 7 chars`), never the real value.
- Use a **fictional brand** ("Secur3Bank"), not a real institution's — no
  impersonation.
- On submit, redirect to a **debrief page** that lists the red flags that were on
  screen the whole time.

**The red flags a victim walks past** (the checklist worth memorizing):
1. **The URL** — `http` not `https`, no padlock, and the domain isn't the real
   bank. The true domain is the **last label before the first single `/`**, so
   `secur3bank.com.evil.ru/login` is really `evil.ru`.
2. **Misspelled/look-alike brand** — `Secur3Bank` (3 for e), cousin domains.
3. **Manufactured urgency** — "verify within 24h or be SUSPENDED" exists to rush
   you past judgment. Urgency + a link + a login ask = the phishing fingerprint.
4. **Unsolicited login link** — you arrived via a handed-to-you link, not by
   typing the address yourself.
5. **Generic greeting** ("Dear Valued Customer") — mass phishing can't personalize.

**Defenses I'd tell a user:** type URLs / use bookmarks for sensitive sites; turn
on **MFA** (a stolen password alone won't be enough); let a **password manager**
be a tripwire — it won't autofill on a look-alike domain, which is a free warning.

**The line I want to hold:** it's fine to *describe* how real phishing infra
works (cousin-domain registration, TLS on look-alike domains, credential-replay
bots, evilginx-style MFA-phishing proxies) as a whiteboard discussion — but don't
build the tooling. Keeping the demo non-functional as an attack tool is exactly
the professional/ethical line the exercise is meant to teach.

## Source

Built a local awareness simulator (Python stdlib `http.server`, zero deps) for a
classroom demo — 2026-08-12.
