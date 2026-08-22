# TIL

> Today I Learned — short, focused notes on things I pick up while studying and
> building. One file per concept, kept concise on purpose.

I'm working through cybersecurity — SOC/blue-team, DFIR, and Active Directory
security — so most notes land there for now. Each entry is something I actually
learned and understood, written in my own words so I remember it.

## Entries

<!-- Add new entries here as you create them. -->

### Active Directory
- [Kerberoasting](active-directory/kerberoasting.md) — how attackers crack service-account passwords offline, and how to detect it
- [DCSync](active-directory/dcsync.md) — abusing replication rights to pull password hashes from a domain controller

### DFIR & Automation
- [Why automated containment needs a human gate](dfir/containment-gate-design.md) — the asymmetry that makes some response actions safe to automate and others not

### AI & LLMs
- [Wiring LLM providers into an app (Claude / Gemini)](ai/swappable-llm-providers.md) — swappable AI backends, and the API gotchas: a constructed client isn't working auth, dated model names 404, "thinking" models return empty output, and free tiers need retries

### Git & Tooling
- [Making GitHub contributions actually count](git/make-contributions-count.md) — why real commits sometimes don't show on the graph

### Exploitation
- [Stack Buffer Overflow](exploitation/stack-buffer-overflow.md) — same bug, two payoffs: overwrite an adjacent variable vs hijack the saved return address
- [TryHackMe Buffer Overflow — Command Cheat Sheet](exploitation/thm-buffer-overflow-cheatsheet.md) — copy-paste recon, offset-finding and payload commands (no python3, printf/perl)
- [SQL Injection](exploitation/sql-injection.md) — it all lives at the unescaped quote: auth bypass, UNION extraction, and blind boolean/time-based

### Social Engineering
- [Phishing Awareness Demo](social-engineering/phishing-awareness-demo.md) — how to demo phishing without building a harvester, and the red flags that give a fake login away

---

## How I add a new entry

```bash
./new.sh <category> <slug>      # e.g. ./new.sh active-directory asreproast
```

That scaffolds a dated file from the template; I fill it in and commit.

## Format

Every entry follows the same shape:
- **What** — the concept in one or two sentences
- **Why it matters** — why I'd care about this in practice
- **Details** — the actual mechanics, commands, or gotchas
- **Source** — where I learned it

_Count: 8 entries_
