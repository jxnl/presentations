# Presentation Starter Kit

This is a starter kit for creating presentation slides using Slidev. Your primary job is to help create, modify, and improve presentation slides.

## Overview

This workspace contains a Slidev presentation starter template with a deck-based structure. Presentations are organized in the `slides/decks/` directory, where each deck is a folder containing its own `slides.md` file and optional supporting files.

**Deck Structure:**

- `slides/decks/reference/` - Contains example/reference slides
- `slides/decks/<deck-name>/` - Individual presentation decks
- Each deck contains `slides.md` and optionally `pages/` for imported slides

**Running Presentations:**

- `bun run dev` - Opens the default "reference" deck
- `bun run dev -- <deck-name>` - Opens a specific deck

Your role is to:

- Create new slides and presentations in the `slides/decks/` directory
- Modify existing slides in any deck
- Add components, animations, and interactive elements
- Help structure content for effective presentations
- Use the tools and patterns documented below to build engaging slides

## Workflow: Content First, Polish Later

This workspace follows a two-phase approach to creating presentations:

### Phase 1: First Draft (Content Creation)

- Use [SLIDEV_DRAFTING.md](./SLIDEV_DRAFTING.md) as your guide
- Focus on content and structure
- Use basic layouts to organize information
- Write speaker notes as you create content
- Minimal or no animations
- Get the material right first

### Phase 2: Polish Mode (Enhancement)

- Use [SLIDEV_POLISHING.md](./SLIDEV_POLISHING.md) as your guide
- Add animations incrementally to specific slides
- Enhance code displays only when needed
- Add visual polish selectively
- Sync presenter notes with animations

**Key Principle:** Don't try to one-shot everything. Build the content first, then enhance specific slides that benefit from animation.

## User Preferences

These preferences guide how slides should be created and structured:

### Content & Structure

- **Slide Density:** Minimal text on slides (key points only), but very detailed speaker notes (almost transcript-like)
- **Purpose:** Mix of inform, edify, and story
- **Foreshadowing:** Always foreshadow key takeaways at the beginning of each section. Use overview slides first ("There are three key things"), then one slide per concept if substantial enough. Include an early slide that explicitly tells the audience: "As you go through this talk, I want you to really pay attention to ideas A, B, C"
- **Slide Titles:** Consistent formatting across all slides
- **Section Breaks:** Divider slides for transitions; use imported submodules for complex sections
- **Quotes:** Standalone slides
- **Call to Action:** Always include a CTA at the end of presentations (e.g., QR codes, links, next steps). Include a slide emphasizing the one key takeaway: "By the end of this talk, I really wanted you to take away one thing: [key takeaway]"

### Visual Style & Animations

- **Transitions:** Very few transitions, mostly static slides
- **Progressive Reveals:** Frequent clicks (every couple seconds) to reveal content progressively - if there are three ideas, each should appear on click rather than all at once
- **Keyword Highlighting:** Use polishing mechanics (like `v-mark`) to highlight keywords between clicks
- **Color:** Subtle accents (themes will be handled later)
- **Images:** Full-screen when possible; ensure everything fits on screen
- **Layouts:** Mix based on content; single-line centered text for transitions (e.g., "So what next?")

### Code & Technical Content

- **Code Blocks:** Informative code blocks with progressive line highlighting between clicks to create movement
- **Math Formulas:** Standalone equation blocks (not inline)

### Diagrams

- **Initial Draft:** Start with full diagrams
- **Polish Phase:** Explore animation case-by-case, but lean toward showing everything

### Lists & Information Display

- **Default:** Bullets for lists
- **Dense Information:** Cards when there's a lot of information that needs to be grouped together (case-by-case basis)

### Examples & Demos

- **Format:** Mostly screenshots

### Workflow

- **Starting Point:** Begin with reference material in `decks/reference/` (transcripts, images, etc.)
- **Polishing:** Polish specific slides that are high-information or really important, not the entire deck at once

### Review Priorities

When reviewing slides, ensure:

1. Everything fits on screen
2. Speaker notes match content
3. Flow/pacing is appropriate

## Reusable Components and Styling

### Components

Components are shared across all decks and are automatically imported from the `slides/components/` directory.

**Component Location:** `slides/components/`

Components placed in this directory are automatically available in all decks without manual imports.

**Important:** Slidev looks for components relative to where the `slides.md` file is located. To make components work across all decks, symlinks are created from each deck's `components/` directory to the shared `slides/components/` directory:

- `decks/<deck-name>/components/` → `../../components/` (symlink)

**When creating a new deck:**
1. Create the deck directory: `slides/decks/<deck-name>/`
2. Create `slides.md` in that directory
3. Create a symlink: `cd slides/decks/<deck-name> && ln -s ../../components components`

**When creating a new component:**
1. Place the component in `slides/components/`
2. It will automatically be available in all decks via the symlinks
3. Use the component directly in slides: `<ComponentName />`

### Counter Component

**Location:** `slides/components/Counter.vue`

**Usage:**

```vue
<Counter :count="10" />
```

### QRCode Component

**Location:** `slides/components/QRCode.vue`

**Usage:**

```vue
<QRCode url="https://example.com" />
<QRCode url="https://example.com" size="250" caption="Scan to visit" />
```

**Props:**
- `url` (required) - URL to encode in QR code
- `size` (optional, default 200) - Size in pixels
- `caption` (optional) - Text to display below QR code

**Configuration:**

- Components are auto-imported via Slidev's built-in unplugin-vue-components
- The `slides.config.ts` file configures component resolution
- The `dev.sh` script ensures Slidev runs from the correct directory to find components
- Components are available in all decks via symlinks from `decks/<deck-name>/components/` to `slides/components/`

## Slidev-Specific Patterns

For detailed Slidev patterns, see:

- **[SLIDEV_DRAFTING.md](./SLIDEV_DRAFTING.md)** - First draft content creation guide
- **[SLIDEV_POLISHING.md](./SLIDEV_POLISHING.md)** - Polish mode enhancement guide

**Quick Reference:**

**Drafting (Content Creation):**

- **Slide Separators:** Use `---` padded with newlines
- **Frontmatter:** `class:`, `layout:`, `layoutClass:`, `src:` for importing slides
- **Grid Layouts:** `grid="~ cols-2 gap-4"` for flexible column layouts
- **Two-Column Layout:** `layout: two-cols` with `::right::` marker
- **Components:** Use Vue components directly in slides, create custom components in `components/` directory
- **Icons:** `<carbon:icon-name />` or `i-carbon:icon-name` class
- **Images:** `<img>` with `border="rounded"` or positioning classes
- **LaTeX:** `$\sqrt{3x-1}$` for inline math, `$$` for block math
- **Diagrams:** Mermaid and PlantUML diagrams with options like `{scale: 0.5}`
- **HTML Comments:** Use `<!-- -->` for basic presenter notes

**Polishing (Enhancement):**

- **Animations:** `v-click`, `v-after`, `v-clicks`, `v-mark`, `v-motion`
- **Code Snippets:** `// #region snippet` with `<<< @/snippets/file.ts#snippet`
- **Line Highlighting:** `{2,3}` for specific lines, `{2-3|5|all}` for dynamic highlighting
- **Monaco Editor:** `{monaco}` for editable code blocks, `{monaco-run}` for executable code, `{monaco-diff}` with `~~~` separator for diffs
- **Magic Move:** ````md magic-move` (four backticks) to animate code changes
- **MDC Syntax:** `[text]{style="..."}`, `:inline-component{prop="value"}`, `::block-component{prop="value"}`
- **HTML Comments:** Sync presenter notes with animations

### Browser Tool Usage

**URL:** `http://localhost:{PORT}/{SLIDE_NUMBER}` (1-indexed)

**Note:** Port may vary. Check terminal output when running `bun run dev` or `slidev --open`.

**Navigation:**

- Direct: `browser_navigate({ url: "http://localhost:{PORT}/9" })`
- Keyboard: `ArrowRight` (next), `ArrowLeft` (previous)

**Viewing:**

- Screenshots: `browser_take_screenshot({ fullPage: true })` or `browser_take_screenshot()`
- Snapshots: `browser_snapshot()`
