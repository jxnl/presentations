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

### FileExplorer Component

The `FileExplorer` component displays an interactive file tree explorer with syntax-highlighted code viewing. It's useful for code walkthroughs, showing project structures, or exploring configuration files.

**Usage:**

```html
<FileExplorer dir="components/example_fs/fastapi-app" />
```

**Props:**

- `dir` (string, required): Directory path relative to `slides/decks/`. For example, `"components/example_fs/fastapi-app"` will display files from `slides/decks/components/example_fs/fastapi-app/`.

**Features:**

- Displays a file tree sidebar with expandable folders
- Click files to view their contents with syntax highlighting
- Automatically expands all folders and selects the first file on mount
- Supports syntax highlighting for many languages (Python, TypeScript, JavaScript, Markdown, JSON, YAML, Bash, Vue, HTML, CSS, Rust, Go, Java, C/C++, and more)
- Uses VS Code-style file icons
- Dark theme optimized for code display

**Example:**

```html
<FileExplorer dir="components/example_fs/fastapi-app" />
```

This will show all files and folders within the specified directory, allowing users to navigate and view file contents directly in the slide.

### Terminal Component

The `Terminal` component displays terminal commands with syntax highlighting and optional output. It's useful for showing installation instructions, command-line examples, API responses, or any terminal-based workflows.

**Usage:**

```html
<!-- Single command with output -->
<Terminal 
  command="npm install slidev"
  output="added 152 packages in 2m"
/>

<!-- Multiple commands -->
<Terminal 
  :lines="[
    { command: 'cd my-project', prompt: '$' },
    { command: 'npm install', output: 'added 152 packages' },
    { command: 'npm run dev', output: 'Server running on http://localhost:3030' }
  ]"
/>
```

**Props:**

- `command` (string, optional): Single command to display
- `output` (string, optional): Output text for the command
- `lines` (array, optional): Array of command/output objects `{ command: string, output?: string, prompt?: string }`
- `prompt` (string, optional, default '$'): Prompt symbol to display before commands
- `shell` (string, optional, default 'bash'): Shell type - `bash`, `zsh`, `powershell`, or `cmd`
- `title` (string, optional): Custom title for the terminal header
- `height` (number, optional, default 300): Height of the terminal in pixels
- `copyable` (boolean, optional, default true): Show copy button on hover

**Features:**

- Syntax highlighting for commands using Shiki (same as FileExplorer)
- Automatic JSON detection and highlighting for output
- Copy-to-clipboard functionality for commands
- Supports multiple command/output pairs
- Consistent styling with FileExplorer component
- Dark theme optimized for code display

**Example:**

```html
<Terminal 
  command="curl https://api.example.com/data"
  output='{
  "status": "success",
  "data": { "id": 123 }
}'
/>
```
