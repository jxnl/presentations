#!/bin/bash

# Launch both async-101 and sync-102 slides on different ports

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

ASYNC_PORT=3030
SYNC_PORT=3031

echo "Starting coding-async-101 on port $ASYNC_PORT..."
slidev --port $ASYNC_PORT "decks/coding-async-101/slides.md" &
ASYNC_PID=$!

echo "Starting coding-sync-102 on port $SYNC_PORT..."
slidev --port $SYNC_PORT "decks/coding-sync-102/slides.md" &
SYNC_PID=$!

echo ""
echo "Slides running:"
echo "  - Async 101: http://localhost:$ASYNC_PORT"
echo "  - Sync 102:  http://localhost:$SYNC_PORT"
echo ""
echo "Press Ctrl+C to stop both servers"

# Wait for both processes and handle cleanup
trap "kill $ASYNC_PID $SYNC_PID 2>/dev/null; exit" INT TERM
wait
