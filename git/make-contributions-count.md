# Making GitHub contributions actually count

**What:** Commits only show up on your GitHub contribution graph if the **author
email on the commit matches a verified email on your GitHub account**. Do real
work with the wrong email configured and the graph stays empty.

**Why it matters:** I assumed committing = green squares. It doesn't. I'd been
committing real work that wasn't being attributed to me because my local git email
wasn't one of my account's verified addresses.

## Details

Check what email your commits use:
```bash
git log -1 --format='%ae'
```
Compare it against **GitHub → Settings → Emails**. The commit email must be listed
**and verified** there.

Two fixes:
- **Add & verify** that email on the settings page — past commits then count
  retroactively.
- Or point git at GitHub's **no-reply** address (always counts, hides your real
  email):
  ```bash
  git config --global user.email "USERNAME@users.noreply.github.com"
  ```
  (Get the exact ID-prefixed one from Settings → Emails.)

Other gotchas that keep real work off the graph:
- **Private repos** don't show on your public profile unless you enable
  *"Include private contributions on my profile"* in contribution settings.
- Commits only count on the **default branch** (or gh-pages), and **forks don't
  count** unless the work becomes a PR.
- Changing your git email only affects **future** commits, not past ones.

## The honest takeaway

The fix for a sparse graph is making real work *count*, not manufacturing fake
commits. Faking it misleads anyone reading the graph as a signal — and it's
obvious when someone clicks in.

## Source

Learned this the practical way while setting up my project repos.
