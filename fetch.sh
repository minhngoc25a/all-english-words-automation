#!/usr/bin/env bash
set -euo pipefail

URL="https://raw.githubusercontent.com/dwyl/english-words/refs/heads/master/words.txt"
TXT="words.txt"
ARCHIVE="words.7z"

# Fetch
curl -fsSL "$URL" -o "$TXT"

# Compress with 7z:
# - Ultra:                 -mx=9
# - LZMA2 method:          -m0=lzma2
# - Dictionary ("word") size 273m: -md=273m
# - Solid block:           -ms=on
#
# Note: dictionary size must be supported by the 7z version you're using.
# If your environment doesn't support 273m, 7z will error.
7z a -t7z "$ARCHIVE" "$TXT" -mx=9 -m0=lzma2 -md=273m -ms=on

# Optional: show output sizes
ls -lh "$TXT" "$ARCHIVE"
