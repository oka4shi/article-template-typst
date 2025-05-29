#!/usr/bin/env bash
set -euo pipefail

declare -A require_fonts

# Read from fonts.list
while IFS='=' read -r raw_name raw_url; do
  # Skip comment or empty line
  [[ -z "$raw_name" || "${raw_name//[[:space:]]/}" = "#" ]] && continue

  # Trim space
  name="${raw_name#"${raw_name%%[![:space:]]*}"}"
  name="${name%"${name##*[![:space:]]}"}"
  url="${raw_url#"${raw_url%%[![:space:]]*}"}"
  url="${url%"${url##*[![:space:]]}"}"

  require_fonts["$name"]="$url"
done < "$(dirname $0)/fonts.list"

mapfile -t installed_families < <(typst fonts --font-path=fonts)

declare -A fam_map=()
for fam in "${installed_families[@]}"; do
  fam_map["${fam,,}"]=1
done

for name in "${!require_fonts[@]}"; do
  key="${name,,}"
  if [[ -z "${fam_map[$key]+x}" ]]; then
    echo "${name}=${require_fonts[$name]}"
  fi
done
