#!/bin/bash

# Build all decks for deployment
# Output structure: dist/<deck-name>/
#
# Usage:
#   ./build-all.sh              # Build all decks
#   ./build-all.sh deck1 deck2  # Build only specified decks
#   ./build-all.sh --force      # Force rebuild all decks

# Don't use set -e with parallel jobs - it causes early exits
# set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DECKS_DIR="$SCRIPT_DIR/decks"
DIST_DIR="$SCRIPT_DIR/dist"
COMPONENTS_DIR="$SCRIPT_DIR/components"
# Note: Parallel builds cause OOM errors even with 2 workers
# Sequential builds are slower but reliable

# Track total build time
TOTAL_START=$(date +%s)

# Create dist directory if it doesn't exist (preserve existing builds for incremental rebuilds)
mkdir -p "$DIST_DIR"

# Check for --force flag
FORCE_REBUILD=false
if [ "$1" = "--force" ]; then
  FORCE_REBUILD=true
  echo "Force rebuild enabled - rebuilding all decks"
  echo ""
fi

# Find all decks (directories with slides.md)
DECKS=()
for deck_dir in "$DECKS_DIR"/*/; do
  if [ -f "${deck_dir}slides.md" ]; then
    deck_name=$(basename "$deck_dir")
    DECKS+=("$deck_name")
  fi
done

echo "Found ${#DECKS[@]} decks: ${DECKS[*]}"
echo ""

# Function to check if a deck needs rebuilding
needs_rebuild() {
  local deck=$1
  local source_file="$DECKS_DIR/$deck/slides.md"
  local dist_file="$DIST_DIR/$deck/index.html"
  
  # Force rebuild if flag is set
  if [ "$FORCE_REBUILD" = true ]; then
    return 0
  fi
  
  # Always rebuild if dist doesn't exist
  if [ ! -f "$dist_file" ]; then
    return 0
  fi
  
  # Rebuild if source is newer than dist
  if [ "$source_file" -nt "$dist_file" ]; then
    return 0
  fi
  
  # Rebuild if shared components changed
  if [ -d "$COMPONENTS_DIR" ]; then
    if find "$COMPONENTS_DIR" -type f -newer "$dist_file" 2>/dev/null | grep -q .; then
      return 0
    fi
  fi
  
  # Rebuild if deck-specific components changed (if it's a real directory, not symlink)
  local deck_components="$DECKS_DIR/$deck/components"
  if [ -d "$deck_components" ] && [ ! -L "$deck_components" ]; then
    if find "$deck_components" -type f -newer "$dist_file" 2>/dev/null | grep -q .; then
      return 0
    fi
  fi
  
  # No rebuild needed
  return 1
}

# Filter decks that need rebuilding
DECKS_TO_BUILD=()
for deck in "${DECKS[@]}"; do
  if needs_rebuild "$deck"; then
    DECKS_TO_BUILD+=("$deck")
  else
    echo "[$deck] ✓ Already up to date, skipping"
  fi
done

if [ ${#DECKS_TO_BUILD[@]} -eq 0 ]; then
  echo ""
  echo "All decks are up to date!"
else
  echo ""
  echo "Building ${#DECKS_TO_BUILD[@]} deck(s) that need updates: ${DECKS_TO_BUILD[*]}"
  echo ""
  
  # Build each deck sequentially (parallel builds cause OOM even with batching)
  for deck in "${DECKS_TO_BUILD[@]}"; do
    echo "[$deck] Starting build..."
    start_time=$(date +%s)
    cd "$SCRIPT_DIR"
    
    # Clean this deck's dist before rebuilding (use absolute path)
    rm -rf "$DIST_DIR/$deck"
    
    # Build with increased memory limit (use absolute path for output)
    build_output=$(NODE_OPTIONS="--max-old-space-size=4096" bun run slidev build "decks/$deck/slides.md" \
      --base "/$deck/" \
      --out "$DIST_DIR/$deck" 2>&1)
    
    end_time=$(date +%s)
    duration=$((end_time - start_time))
    
    # Check if build succeeded (use absolute path)
    if [ -f "$DIST_DIR/$deck/index.html" ]; then
      echo "[$deck] ✓ Built in ${duration}s"
    else
      echo "[$deck] ✗ Build failed in ${duration}s"
      echo "$build_output" | grep -E "(error|Error|Failed)" | head -3
    fi
    echo ""
  done
  
  echo ""
  echo "All builds complete!"
fi

# Create index page listing all decks (always regenerate to include all decks)
echo ""
echo "Creating index page..."

cat > "$DIST_DIR/index.html" << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Presentations</title>
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }
    
    body {
      font-family: "IBM Plex Sans", -apple-system, BlinkMacSystemFont, sans-serif;
      background: #0f0f0f;
      color: #e0e0e0;
      min-height: 100vh;
      padding: 4rem 2rem;
    }
    
    .container {
      max-width: 800px;
      margin: 0 auto;
    }
    
    h1 {
      font-size: 2.5rem;
      font-weight: 600;
      margin-bottom: 0.5rem;
      color: #fff;
    }
    
    .subtitle {
      color: #666;
      margin-bottom: 3rem;
      font-size: 1.1rem;
    }
    
    .decks {
      display: flex;
      flex-direction: column;
      gap: 1rem;
    }
    
    .deck-link {
      display: block;
      padding: 1.5rem 2rem;
      background: #1a1a1a;
      border: 1px solid #2a2a2a;
      border-radius: 8px;
      color: #fff;
      text-decoration: none;
      font-size: 1.25rem;
      font-weight: 500;
      transition: all 0.2s ease;
    }
    
    .deck-link:hover {
      background: #222;
      border-color: #444;
      transform: translateX(4px);
    }
    
    .deck-link code {
      font-family: "IBM Plex Mono", monospace;
      background: #333;
      padding: 0.2rem 0.5rem;
      border-radius: 4px;
      font-size: 0.9em;
      margin-left: 0.5rem;
      color: #888;
    }
  </style>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Mono:wght@400;500&family=IBM+Plex+Sans:wght@400;500;600&display=swap" rel="stylesheet">
</head>
<body>
  <div class="container">
    <h1>Presentations</h1>
    <p class="subtitle">Select a deck to view</p>
    <div class="decks" id="deck-list">
      <!-- Deck links will be inserted here -->
    </div>
  </div>
  <script>
    // This will be replaced with actual deck data
    const decks = DECK_LIST_PLACEHOLDER;
    const container = document.getElementById('deck-list');
    decks.forEach(deck => {
      const link = document.createElement('a');
      link.href = `/${deck}/`;
      link.className = 'deck-link';
      link.innerHTML = `${deck.replace(/-/g, ' ').replace(/\b\w/g, c => c.toUpperCase())} <code>/${deck}/</code>`;
      container.appendChild(link);
    });
  </script>
</body>
</html>
EOF

# Replace placeholder with actual deck list (no jq dependency)
DECK_JSON="["
first=true
for deck in "${DECKS[@]}"; do
  if [ "$first" = true ]; then
    first=false
  else
    DECK_JSON+=","
  fi
  DECK_JSON+="\"$deck\""
done
DECK_JSON+="]"

# Use perl for cross-platform sed compatibility
perl -i -pe "s/DECK_LIST_PLACEHOLDER/$DECK_JSON/" "$DIST_DIR/index.html"

# Create Cloudflare Pages _redirects for SPA routing
echo "Creating Cloudflare Pages configuration..."

# Clear existing _redirects and create fresh
> "$DIST_DIR/_redirects"

# Each deck needs its own SPA fallback and routes for presenter, print, etc.
for deck in "${DECKS[@]}"; do
  echo "/$deck/*  /$deck/index.html  200" >> "$DIST_DIR/_redirects"
done

# Create _headers for caching
cat > "$DIST_DIR/_headers" << 'EOF'
/*
  X-Frame-Options: DENY
  X-Content-Type-Options: nosniff

/*/assets/*
  Cache-Control: public, max-age=31536000, immutable
EOF

echo ""
echo "Build complete!"
echo "Output: $DIST_DIR/"
echo ""
echo "Decks available:"
for deck in "${DECKS[@]}"; do
  echo "  - /$deck/"
done
# Calculate total build time
TOTAL_END=$(date +%s)
TOTAL_DURATION=$((TOTAL_END - TOTAL_START))

echo ""
echo "Total build time: ${TOTAL_DURATION}s"
echo ""
echo "Deploy to Cloudflare Pages:"
echo "  bunx wrangler pages deploy dist --project-name presentations"
echo ""
echo "Or preview locally:"
echo "  cd $DIST_DIR && bunx serve"

