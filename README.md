# Presentation Starter Kit

A Slidev-based presentation starter kit with a deck-based structure for creating and managing multiple presentations. **This setup is designed to be easily used with coding agents** - the structure, documentation, and workflow are optimized for AI-assisted development.

## Overview

This workspace contains a Slidev presentation starter template organized around decks. Each deck is a self-contained presentation that can be developed independently. The kit emphasizes a **content-first workflow**: create your material and structure first, then add animations and polish selectively.

**Agent-Friendly Design:** This setup includes comprehensive documentation, clear patterns, and a structured workflow that coding agents can easily understand and follow. The two-phase approach (drafting then polishing) allows agents to focus on content creation first, then enhance specific slides as needed.

## Personal Customizations

This kit includes customizations specific to the original owner. If you're not the original user, review and update:

- **[AGENTS.md](./AGENTS.md)** - Agent instructions and project-specific guidelines
- **[SLIDEV.md](./SLIDEV.md)** - Presentation conventions and preferred patterns
- **[SLIDEV_POLISHING.md](./SLIDEV_POLISHING.md)** - Animation and polish preferences

Update these files to reflect your own preferences and workflow before using with coding agents.

## Using with Coding Agents

This presentation starter kit is optimized for use with coding agents (like Cursor, GitHub Copilot, or other AI assistants). Key features that make it agent-friendly:

- **Clear Documentation:** Comprehensive guides ([SLIDEV.md](./SLIDEV.md) and [SLIDEV_POLISHING.md](./SLIDEV_POLISHING.md)) provide step-by-step instructions agents can follow
- **Structured Workflow:** The content-first approach gives agents clear phases to work in
- **Consistent Patterns:** Well-documented patterns for layouts, components, and animations
- **Explicit Rules:** Workspace rules and preferences are clearly defined for consistent output
- **Modular Structure:** Deck-based organization allows agents to work on individual presentations without affecting others

When working with agents, they can reference the documentation files to understand the preferred patterns and workflows for creating presentations.

## Quick Start

### Prerequisites

- [Bun](https://bun.sh/) installed on your system

### Running Presentations

```bash
cd slides
bun install
bun run dev              # Opens the default "reference" deck
bun run dev -- <deck-name>  # Opens a specific deck (e.g., `bun run dev -- features`)
```

Visit `http://localhost:3030` (or the port shown in your terminal) to view your presentation.

## Project Structure

```text
presentations/
├── slides/
│   ├── decks/              # All presentation decks
│   │   ├── reference/      # Example/reference deck
│   │   └── <deck-name>/    # Individual presentation decks
│   ├── components/         # Shared Vue components (auto-imported)
│   ├── snippets/          # Code snippets for reuse
│   └── slides.config.ts   # Slidev configuration
├── SLIDEV.md              # Basic Slidev markdown reference
├── SLIDEV_DRAFTING.md     # Content-first drafting guide
└── SLIDEV_POLISHING.md    # Animation and polish guide
```

## Deck Structure

Each deck is a folder in `slides/decks/` containing:

- `slides.md` - The main slide content file
- `pages/` - (Optional) Additional slide files that can be imported using `src:` frontmatter

### Creating a New Deck

1. Create a new directory under `slides/decks/`:

   ```bash
   mkdir slides/decks/my-presentation
   ```

2. Add a `slides.md` file in that directory:

   ```bash
   touch slides/decks/my-presentation/slides.md
   ```

3. Run the deck:

   ```bash
   cd slides
   bun run dev -- my-presentation
   ```

## Workflow: Content First, Polish Later

This workspace follows a two-phase approach:

### Phase 1: First Draft (Content Creation)

Focus on getting your content and structure right:

- Use basic layouts to organize information
- Write detailed speaker notes as you create content
- Minimal or no animations
- Get the material right first

**Guide:** See [SLIDEV.md](./SLIDEV.md) for detailed drafting instructions.

### Phase 2: Polish Mode (Enhancement)

After your content is solid, enhance specific slides:

- Add click animations incrementally to slides that benefit from them
- Enhance code displays with progressive highlighting
- Add visual polish selectively
- Sync presenter notes with animations

**Guide:** See [SLIDEV_POLISHING.md](./SLIDEV_POLISHING.md) for detailed polishing instructions.

**Key Principle:** Don't try to one-shot everything. Build the content first, then enhance specific slides that benefit from animation.

## Key Features

### Components

Components in `slides/components/` are automatically available in all decks without manual imports. Create reusable Vue components here.

**Example:** `slides/components/QRCode.vue` is available as `<QRCode />` in any deck.

### Code Snippets

Store reusable code snippets in `slides/snippets/` and reference them in slides:

```markdown
<<< @/snippets/external.ts#snippet
```

### Themes

The default theme is included. You can customize themes or use different Slidev themes by modifying `slides.config.ts`.

## Documentation

- **[SLIDEV.md](./SLIDEV.md)** - Slidev markdown syntax reference and drafting guide
- **[SLIDEV_POLISHING.md](./SLIDEV_POLISHING.md)** - Complete guide for adding animations and polish

## Development

### Building for Production

```bash
cd slides
bun run build
```

### Exporting Slides

```bash
cd slides
bun run export
```

## Learn More

- [Slidev Documentation](https://sli.dev/)
- [Slidev GitHub](https://github.com/slidevjs/slidev)
