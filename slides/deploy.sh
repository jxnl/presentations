#!/bin/bash

# Full deployment script for Cloudflare Pages
set -e

cd "$(dirname "$0")"

echo "Building all decks..."
./build-all.sh

echo ""
echo "Deploying to Cloudflare Pages..."
bunx wrangler pages deploy dist --project-name presentations

echo ""
echo "Deployment complete!"

