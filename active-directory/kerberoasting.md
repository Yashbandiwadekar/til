# Kerberoasting

**What:** Any domain user can request a Kerberos service ticket (TGS) for any
account that has a Service Principal Name (SPN). Part of that ticket is encrypted
with the service account's password hash — so the attacker takes it offline and
brute-forces the password without ever touching the target or tripping lockout.

**Why it matters:** It turns a *low-privileged* domain account into a path to a
*service* account, which are often over-privileged and have weak, rarely-rotated
passwords. No exploit, no malware — just a normal Kerberos request. It's one of
the most common real-world AD escalation steps.

## Details

The tell is the **encryption type**. Modern Windows uses AES, but attackers
request **RC4 (`0x17`)** tickets because they crack much faster. So a burst of
RC4 service-ticket requests — especially for *user* accounts, not machine
accounts — is the signal.

Detection: **Event ID 4769** (Kerberos service ticket requested) with
`TicketEncryptionType = 0x17`, excluding machine accounts (`$`) and `krbtgt`.

Requesting the ticket (attacker side):
```
# Impacket
GetUserSPNs.py -request -dc-ip <DC> <domain>/<user>:<pass>
```
Cracking it offline:
```
hashcat -m 13100 tickets.txt rockyou.txt
```

## Defenses

- **gMSA** (group Managed Service Accounts) — 120+ char machine-managed passwords,
  auto-rotated. Offline cracking becomes infeasible.
- **Force AES / disable RC4** on service accounts.
- **Delete unused SPNs** — no SPN, no Kerberoasting.

## Source

Building AD detection rules for my DFIR project (mapped to MITRE **T1558.003**).
