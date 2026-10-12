#!/usr/bin/env bash
# Builds the product page and copies it into the site repository root, keeping /docs, CNAME, .nojekyll and .well-known.
#   ./publish.sh [path-to-graphowl-site-checkout]
set -euo pipefail
cd "$(dirname "$0")"
SITE="${1:-../graphowl-site}"
npm run build
rm -rf "$SITE/assets" "$SITE/index.html" "$SITE/style.css" "$SITE/_astro"
cp -R dist/. "$SITE/"
echo "copied into $SITE (docs/, CNAME, .nojekyll, .well-known kept). Commit and push that repository."
