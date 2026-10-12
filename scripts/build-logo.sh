#!/usr/bin/env bash
# Builds the SVG and PNG files in logo/.
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p logo && cd logo

BLACK='#0B0B0C' WHITE='#F5F5F0' ORANGE='#FF5A1F'
HEAD='<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" role="img" aria-label="kode-th"><title>kode-th</title>'

# mark <k color> <dot color> <stroke width> <dot radius>
mark() {
  printf '<path d="M30 14V86M30 64C30 40 72 28 68 48C64 62 42 58 42 58L59 74" fill="none" stroke="%s" stroke-width="%s" stroke-linecap="round" stroke-linejoin="round"/><circle cx="72" cy="86" r="%s" fill="%s"/>' "$1" "$3" "$4" "$2"
}
tile() { printf '<rect width="100" height="100" rx="%s" fill="%s"/>' "$1" "$BLACK"; }

# GitHub rounds avatar corners itself, so the avatar is a plain square.
echo "$HEAD$(tile 0)<g transform=\"translate(9 10) scale(.78)\">$(mark $WHITE $ORANGE 11 8)</g></svg>" > kode-th-avatar.svg
echo "$HEAD$(tile 22)<g transform=\"translate(9 10) scale(.78)\">$(mark $WHITE $ORANGE 11 8)</g></svg>" > kode-th-icon.svg
echo "$HEAD$(mark $BLACK $ORANGE 11 8)</svg>" > kode-th-mark.svg
echo "$HEAD$(mark $WHITE $ORANGE 11 8)</svg>" > kode-th-mark-light.svg
echo "$HEAD$(mark $BLACK $BLACK 11 8)</svg>" > kode-th-mono.svg
# Thicker stroke and bigger dot so the favicon reads at 16px.
echo "$HEAD$(tile 20)<g transform=\"translate(3 4) scale(.9)\">$(mark $WHITE $ORANGE 13 9)</g></svg>" > favicon.svg

CHROME="${CHROME:-$HOME/.cache/ms-playwright/chromium_headless_shell-1248/chrome-headless-shell-linux64/chrome-headless-shell}"
shot() { "$CHROME" --no-sandbox --hide-scrollbars --default-background-color=00000000 --window-size="$2,$2" --screenshot="$PWD/$3" "file://$PWD/$1" 2>/dev/null; }
shot kode-th-avatar.svg 512 kode-th-avatar-512.png
shot kode-th-icon.svg 1024 kode-th-icon-1024.png
shot favicon.svg 16 favicon-16.png
shot favicon.svg 32 favicon-32.png
shot favicon.svg 180 apple-touch-icon.png
