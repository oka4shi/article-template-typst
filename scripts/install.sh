#!/usr/bin/env bash
set -euo pipefail

# Colour definitions
RED='\033[31m'
YELLOW='\033[33m'
GREEN='\033[32m'
CYAN='\033[36m'
BOLD='\033[1m'
RESET='\033[0m'

declare -A missing_fonts=()

if ! command -v unzip >/dev/null 2>&1; then
  printf "%b%d unzip is required to run this script%b\n" \
    "$YELLOW" "${#missing_fonts[@]}" "$RESET"
  exit 1
fi

# Read from stdin
while IFS='=' read -r name url; do
  # Skip comment or empty line
  [[ -z "$name" || "${name//[[:space:]]/}" = "#" ]] && continue

  missing_fonts["$name"]="$url"
done

mkdir -p fonts

# TODO: consider multithread
for name in "${!missing_fonts[@]}"; do
  echo "Download ${name}..."
  # Create temporary directory for each font
  TEMP_DIR=$(mktemp -d)
  wget -q ${missing_fonts[$name]} -P "$TEMP_DIR/"
  
  # Unzip in the temporary directory
  shopt -s nullglob
  for zip_file in "$TEMP_DIR"/*.zip; do
    echo "Unzipping ${zip_file}..."
    if ! unzip -q "$zip_file" -d "$TEMP_DIR/"; then
      printf "%b[WARN]%b Failed to unzip %s\n" "$YELLOW" "$RESET" "$zip_file" >&2
    fi
  done
  shopt -u nullglob

  # Copy only font files to fonts directory
  find "$TEMP_DIR" -type f \( -name "*.ttf" -o -name "*.otf" \) -exec cp {} fonts/ \;

  # Cleanup
  rm -rf "$TEMP_DIR"
done
