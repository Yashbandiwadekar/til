#!/usr/bin/env bash
# new.sh — scaffold a new TIL entry from the standard template.
# Usage:  ./new.sh <category> <slug>
#   e.g.  ./new.sh active-directory asreproast
set -euo pipefail

if [ $# -ne 2 ]; then
  echo "Usage: $0 <category> <slug>"
  echo "  e.g. $0 active-directory asreproast"
  exit 1
fi

category="$1"
slug="$2"
dir="$category"
file="$dir/$slug.md"

mkdir -p "$dir"

if [ -e "$file" ]; then
  echo "Already exists: $file"
  exit 1
fi

# Title Case the slug for the heading (hyphens -> spaces).
title="$(echo "$slug" | tr '-' ' ' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)}1')"

cat > "$file" <<EOF
# $title

**What:** <one or two sentences — the concept>

**Why it matters:** <why you'd care about this in practice>

## Details

<the actual mechanics, commands, or gotchas>

## Source

<where you learned it — $(date +%F)>
EOF

echo "Created $file"
echo "Edit it, then:  git add $file && git commit -m 'TIL: $title' && git push"
