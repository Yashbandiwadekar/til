# Wiring LLM providers into an app (Claude / Gemini)

**What:** Lessons from adding real AI triage to a project — making the LLM
backend swappable (Claude ↔ Gemini ↔ a deterministic fallback), and the
non-obvious ways the provider APIs bite you.

**Why it matters:** "Add an AI call" sounds like one line. The reliability work
— falling back gracefully, picking a model that won't disappear, and not
trusting a client that only *looks* configured — was most of the actual effort.

## The gotchas that cost me time

### 1. A constructed SDK client is NOT proof the credentials work
`anthropic.Anthropic()` (and most SDKs) construct fine with **no key**. They
only fail when you actually make a call. So a health check like this lies:

```python
client = anthropic.Anthropic()   # succeeds even with no API key
return {"ai_available": client is not None}   # <-- false positive
```

My health endpoint reported `available: true` for ages while every real call
was silently failing over to the fallback engine. Fix: gate on the credential
actually being present, or make a tiny real call.

```python
if not (os.getenv("ANTHROPIC_API_KEY") or os.getenv("ANTHROPIC_AUTH_TOKEN")):
    return None   # don't even build the client; let another provider take over
```

This also fixed a real bug: the always-constructed client **shadowed** the
Gemini provider, so Gemini never got a turn.

### 2. Dated model names get retired — use a `-latest` alias
`gemini-2.0-flash` returned **404 "no longer available."** Hard-coding a dated
model name is a time bomb. `gemini-flash-lite-latest` tracks the current model
and won't 404 when Google rotates versions. (List what a key can actually see:
`GET /v1beta/models?key=...`.)

### 3. "Thinking" models can return an empty response
The full `gemini-*-flash` models are reasoning models. With a small
`maxOutputTokens` they spend the **whole budget thinking** and return HTTP 200
with **no text**. Baffling to debug — looks like success, gives you nothing.
For cheap, high-volume structured tasks (like triage) use **flash-lite**, or
give a generous token budget.

### 4. Free tiers throw transient 503 / 429 — retry with backoff
Google's free tier intermittently returns 503 (overloaded). One request looks
broken; a 2–3 try retry with a short backoff makes it reliable.

## The pattern that made it robust

Pick the engine by **which key is present**, and always keep a no-key fallback
so the app never hard-depends on an external API:

```
ANTHROPIC_API_KEY  -> Claude
GEMINI_API_KEY     -> Gemini
neither            -> deterministic rules engine
```

One `finalize(data)` step normalizes whatever JSON any model returns into the
same strict contract, so the rest of the app never knows which provider ran.
Every model call is wrapped so a failure **degrades** (to the next provider, or
to rules) instead of blocking the user's action.

## The honest takeaway

The interesting engineering in "add AI" isn't the prompt — it's everything
around the call: credential checks that don't lie, model names that don't rot,
and a fallback so a flaky free tier can't take your app down.

## Source

Building the AI triage for a civic-issue reporting app, 2026-08-23.
