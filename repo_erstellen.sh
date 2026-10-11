#!/usr/bin/env bash
# Legt dieses Paket als GitHub-Repository an und lädt alles hoch.
# Aufruf: ./repo_erstellen.sh            (öffentlich)
#         ./repo_erstellen.sh --private  (privat)
# Voraussetzung: GitHub CLI (https://cli.github.com) und git.
set -euo pipefail
cd "$(dirname "$0")"
NAME="licht-und-weite"
SICHT="--public"; [ "${1:-}" = "--private" ] && SICHT="--private"
gh auth status >/dev/null 2>&1 || gh auth login
gh auth setup-git
if [ -z "$(git config user.email 2>/dev/null || true)" ]; then
  LOGIN=$(gh api user -q .login); ID=$(gh api user -q .id)
  git config --global user.name "$LOGIN"
  git config --global user.email "${ID}+${LOGIN}@users.noreply.github.com"
fi
if [ ! -d .git ]; then
  git init -q -b main
  git add .
  git commit -qm "Licht & Weite – Vorlagenpaket"
fi
gh repo create "$NAME" $SICHT --source . --remote origin --push \
  --description "Instagram-Vorlage „Licht & Weite“ für das Projekt Jesus auch Muslim"
echo ""
echo "Fertig: $(gh repo view "$NAME" --json url -q .url)"
