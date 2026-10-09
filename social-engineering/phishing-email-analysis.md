# Phishing Email Analysis

**What:** How a SOC analyst triages a suspicious email: read the headers to find where it *really* came from, inspect the body and links for deception, detonate attachments/URLs safely, and then decide how to respond and prevent a repeat.

**Why it matters:** Phishing is still the most common way in, and the visible parts of an email (display name, link text) are the easiest to fake. The analyst's job is to ignore what the email *claims* and verify what it *is*. This is core SOC Level 1 work.

## Details

**1. Anatomy: what to read first**
- **Envelope vs header:** the `From` the user sees can be anything. Check `Return-Path`, `Reply-To` and the `Received` chain (read bottom-up, the bottom hop is closest to the real sender).
- **Authentication results:** **SPF** (is the sending IP allowed for the domain?), **DKIM** (is the signature valid?), **DMARC** (do they align with the `From` domain, and what is the policy?). A fail or mismatch is a strong signal, but a pass isn't proof of safety, since attackers also register their own look-alike domains with valid SPF/DKIM.
- **Message-ID and X-headers** help correlate a campaign across many emails.

**2. Indicators in the content**
- Urgency or threats, generic greeting, unexpected request for credentials, payment, or gift cards.
- **Sender spoofing / look-alike domains** (`paypa1.com`, `micros0ft-support.net`) and a mismatched `Reply-To`.
- **Link text vs real href.** Hover to see the true destination. Watch for URL shorteners and homograph domains.
- **Attachments:** Office docs with macros, `.iso`/`.img`, `.html`, double extensions like `invoice.pdf.exe`.

**3. Tools (never open the thing on your own machine)**
- **Headers:** a header analyzer (e.g. MxToolbox / Google Admin Toolbox) to parse the hop chain and SPF/DKIM/DMARC.
- **Hashes and reputation:** get the SHA256 of the attachment and look it up on VirusTotal or similar instead of opening it.
- **URLs:** defang before sharing (`hxxps://evil[.]com`), then check in a URL scanner or sandbox (URLScan, Any.Run, Joe Sandbox) and view WHOIS and domain age.
- **Sandbox:** detonate attachments in an isolated VM to watch process, network and file behaviour.

**4. Respond, then prevent**
- Respond: block sender/domain/URL, search the mailbox for other recipients, purge the email, and reset credentials if someone clicked or submitted.
- Prevent: enforce SPF/DKIM/DMARC (with a real `p=quarantine/reject` policy), email gateway filtering, **MFA** so a stolen password isn't enough, and user awareness and a simple "report phish" button.

**Workflow I'll reuse:** headers → sender/auth → links and attachments → reputation/sandbox → verdict → contain and report.

## Source

TryHackMe, **SOC Level 1** path, the phishing rooms: *Phishing Analysis Fundamentals*, *Phishing Emails in Action*, *Phishing Analysis Tools*, *Phishing Prevention*, plus the practice challenges *The Greenholt Phish* and *Snapped Phish-ing Line* — 2026-10-10.
