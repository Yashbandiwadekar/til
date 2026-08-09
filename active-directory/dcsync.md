# DCSync

**What:** DCSync abuses the **directory replication** protocol (MS-DRSR) that
domain controllers normally use to sync with each other. An account holding the
replication rights can *ask* a DC to hand over any user's password hash — including
the domain Administrator or `krbtgt` — as if it were another DC. No code runs on
the DC; it just answers a legitimate-looking replication request.

**Why it matters:** It's effectively "game over" for the domain. Getting the
`krbtgt` hash enables Golden Tickets (forge any Kerberos ticket, persist
indefinitely). The scary part is it's often reachable through a *chain* of small
misconfigurations rather than admin access directly.

## Details

The rights that grant it (on the domain object's ACL):
- **DS-Replication-Get-Changes**
- **DS-Replication-Get-Changes-All**

The lesson that stuck with me: these are sometimes granted to non-obvious groups.
In a lab I studied, a custom `IT-SUPPORT` group had them — so anyone who could get
into that group (via an ACL abuse like `GenericAll`) inherited DCSync.

Detection: **Event ID 4662** on the DC, referencing the replication GUID
(`DS-Replication-Get-Changes`), from a principal that is **not** a domain
controller. That "not a DC" part is the whole signal — real DCs replicate all the
time; a workstation or service account doing it does not.

Performing it (attacker side):
```
secretsdump.py -just-dc-user Administrator <domain>/<user>:<pass>@<DC>
```

## Defenses

- **Remove replication rights from everything that isn't a DC.** Audit the
  domain object ACL directly.
- Run **BloodHound** yourself to find who can reach these rights through chains.
- Enable **Directory Service Access** auditing so 4662 is actually generated.

## Source

AD hardening work for my DFIR project (MITRE **T1003.006**). Detected by the
`credential_access` path since T1003.006 falls under T1003.
