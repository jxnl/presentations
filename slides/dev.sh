#!/bin/bash

# Get deck name from argument or default to "reference"
# bun run dev -- mydeck passes arguments after --, so we take the first non -- argument
DECK="reference"
for arg in "$@"; do
  if [ "$arg" != "--" ] && [ -n "$arg" ]; then
    DECK="$arg"
    break
  fi
done

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DECK_PATH="$SCRIPT_DIR/decks/$DECK/slides.md"

# Change to the slides directory so Slidev resolves components correctly
cd "$SCRIPT_DIR"

# Run slidev with the deck's slides.md file
slidev --open "$DECK_PATH"

