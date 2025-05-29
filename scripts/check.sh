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

# Read from stdin
while IFS='=' read -r name url; do
  # Skip comment or empty line
  [[ -z "$name" || "${name//[[:space:]]/}" = "#" ]] && continue

  missing_fonts["$name"]="$url"
done


# If any input arrived, treat each as a missing font and emit a warning
if (( ${#missing_fonts[@]} )); then
  for font in "${!missing_fonts[@]}"; do
    printf "%b• %b${BOLD}%s${RESET}%b is missing\n" \
      "$RED" "" "$font" "$RED"
    printf "   → Download at: %b%s%b\n" \
      "$CYAN" "${missing_fonts[$font]}" "$RESET"
  done
  printf "\n%b%d font(s) is missing%b\n" \
    "$YELLOW" "${#missing_fonts[@]}" "$RESET"
  exit 1
else
  printf "%b✓ All required fonts are available!%b\n" \
    "$GREEN$BOLD" "$RESET"
fi
