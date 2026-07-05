#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUT="$ROOT/Hadi-Mardanian-Resume.pdf"
HTML="file://$ROOT/index.html"

timeout 60 google-chrome \
  --headless=new \
  --disable-gpu \
  --no-sandbox \
  --user-data-dir="/tmp/chrome-resume-pdf" \
  --virtual-time-budget=15000 \
  --print-to-pdf="$OUT" \
  --print-to-pdf-no-header \
  --no-pdf-header-footer \
  "$HTML"

echo "PDF generated: $OUT ($(du -h "$OUT" | cut -f1))"
