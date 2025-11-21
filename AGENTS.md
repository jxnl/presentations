# Presentation Starter Kit

This is a starter kit for creating presentation slides using Slidev. Your primary job is to help create, modify, and improve presentation slides.

## Your Role

- Create new slides and presentations in the `slides/decks/` directory
- Modify existing slides in any deck
- Add components, animations, and interactive elements
- Help structure content for effective presentations

## Project Structure

Presentations are organized in the `slides/decks/` directory, where each deck is a folder containing its own `slides.md` file.

- `slides/decks/reference/` - Contains example/reference slides
- `slides/decks/<deck-name>/` - Individual presentation decks
- Each deck contains `slides.md` and optionally `pages/` for imported slides

## Documentation

For all Slidev patterns, syntax, and workflows, refer to:

- **[SLIDEV.md](./SLIDEV.md)** - Basic Slidev markdown syntax reference
- **[SLIDEV_POLISHING.md](./SLIDEV_POLISHING.md)** - Complete guide for adding animations and polish

## Running Presentations

To start a presentation server:

```bash
cd slides
bun run dev              # Opens the default "reference" deck
bun run dev -- <deck-name>  # Opens a specific deck (e.g., `bun run dev -- features`)
```

The server will start on `http://localhost:3030` (or the port shown in terminal output).

## Browser Tool Usage

**URL:** `http://localhost:{PORT}/{SLIDE_NUMBER}` (1-indexed)

**Note:** Port may vary. Check terminal output when running `bun run dev` or `slidev --open`.

**Navigation:**

- Direct: `browser_navigate({ url: "http://localhost:{PORT}/9" })`
- Keyboard: `ArrowRight` (next), `ArrowLeft` (previous)

**Viewing:**

- Screenshots: `browser_take_screenshot({ fullPage: true })` or `browser_take_screenshot()`
- Snapshots: `browser_snapshot()`

## Components

Components in `slides/components/` are automatically available in all decks without manual imports. They can be used directly in markdown slides using Vue syntax.

**Available Components:**

- **Callout** - Highlight information with styled callout boxes (`Callout.vue`)
- **Chart** - Data visualization with bar, line, and doughnut charts (`Chart.vue`)
- **FileExplorer** - Interactive file tree explorer with syntax highlighting (`FileExplorer.vue`)
- **QRCode** - Generate QR codes dynamically (`QRCode.vue`)
- **Terminal** - Display terminal commands with syntax highlighting (`Terminal.vue`)

**Full Documentation:** See [slides/components/README.md](./slides/components/README.md) for detailed usage, props, and examples for each component.

### When to Use Each Component

- **Callout** - Highlight important info, warnings, tips, or side notes
- **Chart** - Visualize data, trends, comparisons, or proportions
- **FileExplorer** - Show project structure or walk through code files interactively
- **QRCode** - Share links or resources quickly with the audience
- **Terminal** - Show commands, installation steps, or CLI workflows
