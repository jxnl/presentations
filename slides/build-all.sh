#!/bin/bash

# Build all decks for deployment
# Output structure: dist/<deck-name>/

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DECKS_DIR="$SCRIPT_DIR/decks"
DIST_DIR="$SCRIPT_DIR/dist"

# Clean dist directory
rm -rf "$DIST_DIR"
mkdir -p "$DIST_DIR"

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

# Build each deck
for deck in "${DECKS[@]}"; do
  echo "Building $deck..."
  
  cd "$SCRIPT_DIR"
  
  # Build with base path set to /deck-name/
  npx slidev build "decks/$deck/slides.md" \
    --base "/$deck/" \
    --out "dist/$deck"
  
  echo "Built $deck -> dist/$deck/"
  echo ""
done

# Create index page listing all decks
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

echo ""
echo "Build complete!"
echo "Output: $DIST_DIR/"
echo ""
echo "Decks available:"
for deck in "${DECKS[@]}"; do
  echo "  - /$deck/"
done
echo ""
echo "To preview locally:"
echo "  cd $DIST_DIR && npx serve"

