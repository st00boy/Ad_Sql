#!/bin/bash

# Advanced sqlmap automation script for legal security testing
# Supports cookies, proxies, tamper scripts, and custom headers

set -euo pipefail
IFS=$'\n\t'

URL="${1:-}"
COOKIES="${2:-}"
PROXY="${3:-}"
TAMPER="${4:-}"
OUTPUT_DIR="sqlmap_logs"

# Check for sqlmap
if ! command -v sqlmap &>/dev/null; then
  echo "[-] sqlmap is not installed. Please install it first." >&2
  exit 1
fi

# Help message
if [[ -z "$URL" ]]; then
  echo "Usage: $0 <url> [cookies] [proxy] [tamper_script]"
  echo
  echo "Example:"
  echo "  $0 'http://example.com' 'PHPSESSID=xyz' 'http://127.0.0.1:8080' 'between,space2comment'"
  exit 1
fi

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Base command
CMD=(sqlmap -u "$URL"
  --batch
  --crawl=3
  --forms
  --smart
  --random-agent
  --threads=4
  --output-dir="$OUTPUT_DIR"
  --banner
  --dbs
)

# Optional: Add cookies
if [[ -n "$COOKIES" ]]; then
  CMD+=(--cookie="$COOKIES")
fi

# Optional: Add proxy
if [[ -n "$PROXY" ]]; then
  CMD+=(--proxy="$PROXY")
fi

# Optional: Add tamper scripts
if [[ -n "$TAMPER" ]]; then
  CMD+=(--tamper="$TAMPER")
fi

# Run command
echo "[*] Running sqlmap scan with options:"
printf ' %q' "${CMD[@]}"
echo
"${CMD[@]}"

echo "[*] Scan complete. Logs saved in: $OUTPUT_DIR"

