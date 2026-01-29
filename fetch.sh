#!/usr/bin/env bash
set -euo pipefail

URL="https://raw.githubusercontent.com/dwyl/english-words/refs/heads/master/words.txt"
TXT="words.txt"
ARCHIVE="words.zip"

# Download the word list
curl -fsSL "$URL" -o "$TXT"

# Create zip with maximum compression
# -9 = best compression
zip -9 "$ARCHIVE" "$TXT"

# Optional: show file sizes
ls -lh "$TXT" "$ARCHIVE"
