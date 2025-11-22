# Presentation Starter Kit - Agent Instructions

Create and modify presentation slides in `slides/decks/` using Slidev.

## Workflow Principles

**Important:** Ask questions, work incrementally, understand goals.

1. **Ask questions first** - Don't assume. Clarify:
   - What is the user trying to accomplish?
   - What's the presentation topic and audience?
   - What style or tone do they want?
   - Are they drafting new content or polishing existing slides?

2. **Don't do too much at once** - Work incrementally:
   - Make one change at a time
   - Show progress and get feedback before continuing
   - Don't refactor entire decks without explicit request
   - Don't add animations during content creation

3. **Work on one slide at a time** - Especially when polishing:
   - Focus on a single slide
   - Test and verify before moving to the next
   - Get user confirmation before proceeding
   - Don't batch process multiple slides

4. **Understand user goals** - Before making changes:
   - What problem are they trying to solve?
   - What's the intended outcome?
   - What constraints exist (time, audience, style)?
   - Confirm understanding before implementing

**When in doubt, ask. Don't guess.**

## Getting Started

### Deck Setup

Each deck needs a `components/` symlink to `../../components`:

```bash
cd slides/decks/<deck-name>
ln -s ../../components components
```

This allows deck-specific component overrides while sharing common components.

### Running Presentations

**Background (for agents):**

```bash
cd slides && bun run dev -- <deck-name> &
```

Or use terminal tool with `is_background: true`:

```python
run_terminal_cmd(command="cd slides && bun run dev -- <deck-name>", is_background=True)
```

Server: `http://localhost:3030` (or port shown)

### Browser Tool Usage

- Navigate: `browser_navigate({ url: "http://localhost:{PORT}/{SLIDE_NUMBER}" })`
- Screenshot: `browser_take_screenshot({ fullPage: true })`
- Slide numbers are 1-indexed

## Documentation Navigation

Reference files based on task:

| Task | File | When |
|------|------|------|
| First time / setup | `docs/GETTING_STARTED.md` | Getting started |
| Creating/editing slides | `docs/BASICS.md` | Daily slide work |
| New presentation | `docs/DRAFTING.md` | Content creation workflow |
| Adding animations | `docs/POLISHING.md` | After content is complete |
| Advanced features | `docs/ADVANCED.md` | Monaco, Magic Move, complex animations |
| Syntax lookup | `docs/REFERENCE.md` | Specific syntax/props |
| Components | `slides/components/README.md` | Using any component |

### Workflow Rules

1. **New presentation:** `docs/DRAFTING.md` → `docs/BASICS.md` → (later) `docs/POLISHING.md`
2. **Adding animations:** `docs/POLISHING.md` → `docs/BASICS.md` (or `docs/ADVANCED.md` if needed)
3. **Syntax questions:** `docs/BASICS.md` → `docs/ADVANCED.md` → `docs/REFERENCE.md`
4. **Never polish during first draft** - content first, polish later

## Components

Auto-imported from `slides/components/`. Available: Callout, Chart, FileExplorer, QRCode, Terminal, AgentView.

**Details:** See `slides/components/README.md`

**Workflow:**

- **Drafting:** Only QRCode allowed (end-of-slide CTAs)
- **Polishing:** All components allowed

**When to use:**

- Callout - Important info, warnings, tips
- Chart - Data visualization
- FileExplorer - Code walkthroughs
- QRCode - Share links/resources
- Terminal - Commands, CLI workflows
- AgentView - AI agent interactions

### Adding Components

1. Create in `slides/components/`
2. Document in `slides/components/README.md`
3. Update this file's component list
4. Add workflow guidance above

## Deck-Specific Personalization

When you learn personalization preferences for a deck, save them in `slides/decks/<deck-name>/AGENTS.md`.

Always check for `AGENTS.md` in the deck directory before starting work.
