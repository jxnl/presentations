#!/bin/bash

# Click Animation Validation Script
# Checks that v-click directives and [click] markers in presenter notes are aligned

SLIDES_FILE="$1"

if [ -z "$SLIDES_FILE" ]; then
  echo "Usage: ./validate-clicks.sh <slides.md>"
  exit 1
fi

if [ ! -f "$SLIDES_FILE" ]; then
  echo "Error: File not found: $SLIDES_FILE"
  exit 1
fi

echo "Validating clicks in: $SLIDES_FILE"
echo ""

# Extract slide separators and analyze each slide
slide_num=0
in_slide=false
click_count=0
note_click_count=0
current_slide=""

while IFS= read -r line; do
  # Detect slide separator
  if [[ "$line" =~ ^--- ]]; then
    if [ "$in_slide" = true ]; then
      # End of slide - validate
      if [ $click_count -ne $note_click_count ] && [ $click_count -gt 0 ]; then
        echo "⚠️  Slide $slide_num: MISMATCH - $click_count clicks but $note_click_count [click] markers"
        echo "   Content: $current_slide"
        echo ""
      fi
    fi
    slide_num=$((slide_num + 1))
    in_slide=true
    click_count=0
    note_click_count=0
    current_slide=""
    continue
  fi

  if [ "$in_slide" = true ]; then
    # Count v-click (but not v-after, v-clicks needs special handling)
    if [[ "$line" =~ v-click[^a] ]]; then
      click_count=$((click_count + 1))
    fi
    
    # Count v-clicks items (rough estimate - counts list items)
    if [[ "$line" =~ ^-.*v-clicks ]] || [[ "$line" =~ ^-.*\<v-clicks ]]; then
      # This is approximate - v-clicks children need manual counting
      : # Skip for now
    fi
    
    # Count [click] markers in comments
    if [[ "$line" =~ \[click ]]; then
      note_click_count=$((note_click_count + 1))
    fi
    
    # Store first non-empty line as slide identifier
    if [ -z "$current_slide" ] && [[ ! "$line" =~ ^[[:space:]]*$ ]] && [[ ! "$line" =~ ^[[:space:]]*<!-- ]]; then
      current_slide=$(echo "$line" | head -c 50)
    fi
  fi
done < "$SLIDES_FILE"

# Check last slide
if [ $click_count -ne $note_click_count ] && [ $click_count -gt 0 ]; then
  echo "⚠️  Slide $slide_num: MISMATCH - $click_count clicks but $note_click_count [click] markers"
fi

echo "✅ Validation complete"
echo ""
echo "Note: This is a basic check. Manual verification is still recommended for:"
echo "  - v-clicks components (count children manually)"
echo "  - v-after elements (don't increment counter)"
echo "  - v-mark click numbers"
echo "  - Complex nested structures"

