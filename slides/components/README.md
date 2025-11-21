# Components

All components in this directory are automatically available in any Slidev deck without manual imports. They can be used directly in markdown slides using Vue syntax.

## Available Components

- [Callout](#callout) - Highlight information with styled callout boxes
- [Chart](#chart) - Data visualization with bar, line, and doughnut charts
- [FileExplorer](#fileexplorer) - Interactive file tree explorer with syntax highlighting
- [QRCode](#qrcode) - Generate QR codes dynamically
- [Terminal](#terminal) - Display terminal commands with syntax highlighting

---

## Callout

Highlight important information with styled callout boxes. Perfect for drawing attention to tips, warnings, success messages, errors, and notes.

**File:** `Callout.vue`

### Usage

```html
<Callout type="info">
This is an informational callout with helpful context.
</Callout>

<Callout type="warning" title="Important">
Make sure to save your work before proceeding.
</Callout>

<Callout type="success">
Operation completed successfully!
</Callout>

<Callout type="error" title="Error">
Something went wrong. Please try again.
</Callout>

<Callout type="tip" title="Pro Tip">
Use keyboard shortcuts to navigate faster.
</Callout>

<Callout type="note" title="Note">
This is a general note callout.
</Callout>
```

### Props

- `type` (optional, default: `'info'`) - One of: `info`, `warning`, `success`, `error`, `tip`, `note`
- `title` (optional) - Title text displayed above the content

### Available Types

- `info` - Blue, informational content
- `warning` - Yellow/amber, important warnings
- `success` - Green/emerald, success messages
- `error` - Red/rose, error messages
- `tip` - Purple/violet, helpful tips
- `note` - Gray, general notes

### Usage with Click Animations

Callouts work great with click animations to reveal information progressively:

```html
<!-- Click 1 -->
<Callout type="info" v-click>
This callout appears after the first click.
</Callout>

<!-- Click 2 -->
<Callout type="warning" v-click>
This warning appears after the second click.
</Callout>
```

---

## Chart

Visualize data with bar, line, and doughnut charts powered by Chart.js. Perfect for data-driven presentations.

**File:** `Chart.vue`

### Usage

```html
<!-- Bar Chart -->
<Chart 
  type="bar"
  title="Monthly Sales"
  :labels="['Jan', 'Feb', 'Mar', 'Apr', 'May']"
  :datasets="[{
    label: 'Sales',
    data: [12, 19, 3, 5, 2]
  }]"
/>

<!-- Line Chart -->
<Chart 
  type="line"
  title="User Growth"
  :labels="['Q1', 'Q2', 'Q3', 'Q4']"
  :datasets="[{
    label: 'Users',
    data: [100, 150, 200, 250]
  }]"
/>

<!-- Doughnut Chart -->
<Chart 
  type="doughnut"
  title="Device Distribution"
  :labels="['Mobile', 'Desktop', 'Tablet']"
  :datasets="[{
    data: [45, 30, 15],
    backgroundColor: ['#3B82F6', '#10B981', '#F59E0B']
  }]"
  :height="400"
/>
```

### Props

- `type` (required) - Chart type: `bar`, `line`, or `doughnut`
- `labels` (required) - Array of label strings for the x-axis (or categories for doughnut)
- `datasets` (required) - Array of dataset objects (see Chart.js documentation for full options)
- `title` (optional) - Chart title displayed above the chart
- `height` (optional, default 400) - Chart height in pixels

### Chart Types

- **Bar** - Vertical bar chart for comparing categories
- **Line** - Line chart for showing trends over time
- **Doughnut** - Circular chart for showing proportions

### Customization

You can override any Chart.js dataset options by passing them in the `datasets` array:

```html
<Chart 
  type="bar"
  :labels="['A', 'B', 'C']"
  :datasets="[{
    label: 'Custom',
    data: [10, 20, 30],
    backgroundColor: '#FF5733',
    borderColor: '#C0392B',
    borderWidth: 3
  }]"
/>
```

---

## FileExplorer

Display an interactive file tree explorer with syntax-highlighted code viewing. Perfect for code walkthroughs, showing project structures, or exploring configuration files.

**File:** `FileExplorer.vue`

### Usage

```html
<FileExplorer dir="components/example_fs/fastapi-app" />
```

### Props

- `dir` (required) - Directory path relative to `slides/decks/`. For example, `"components/example_fs/fastapi-app"` will display files from `slides/decks/components/example_fs/fastapi-app/`.

### Features

- Interactive file tree sidebar with expandable folders
- Click files to view their contents with syntax highlighting
- Automatically expands all folders and selects the first file on mount
- Supports syntax highlighting for many languages (Python, TypeScript, JavaScript, Markdown, JSON, YAML, Bash, Vue, HTML, CSS, Rust, Go, Java, C/C++, and more)
- Uses VS Code-style file icons
- Dark theme optimized for code display

### Example

```html
<FileExplorer dir="components/example_fs/fastapi-app" />
```

This will show all files and folders within the specified directory, allowing users to navigate and view file contents directly in the slide.

---

## QRCode

Generate QR codes dynamically in your slides. Useful for sharing links, resources, or follow-up materials.

**File:** `QRCode.vue`

### Usage

```html
<QRCode url="https://example.com" />

<QRCode url="https://example.com" size="250" caption="Scan to visit" />
```

### Props

- `url` (required) - URL to encode in QR code
- `size` (optional, default 200) - Size in pixels
- `caption` (optional) - Text to display below QR code

### Example

```html
<QRCode 
  url="https://sli.dev" 
  size="150" 
  caption="Scan to visit Slidev documentation" 
/>
```

---

## Terminal

Display terminal commands with syntax highlighting and optional output. Useful for showing installation instructions, command-line examples, API responses, or any terminal-based workflows.

**File:** `Terminal.vue`

### Usage

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
  :height="250"
/>

<!-- With JSON output -->
<Terminal 
  command="curl https://api.example.com/data"
  output='{
  "status": "success",
  "data": { "id": 123 }
}'
/>

<!-- Different shell types -->
<Terminal shell="bash" prompt="$" command="echo 'Hello'" />
<Terminal shell="powershell" prompt="PS>" command="Write-Host 'Hello'" />
```

### Props

- `command` (optional) - Single command to display
- `output` (optional) - Output text for the command
- `lines` (optional) - Array of command/output objects `{ command: string, output?: string, prompt?: string }`
- `prompt` (optional, default `'$'`) - Prompt symbol to display before commands
- `shell` (optional, default `'bash'`) - Shell type: `bash`, `zsh`, `powershell`, or `cmd`
- `title` (optional) - Custom title for the terminal header
- `height` (optional, default 300) - Height of the terminal in pixels
- `copyable` (optional, default true) - Show copy button on hover

### Features

- Syntax highlighting for commands using Shiki (same as FileExplorer)
- Automatic JSON detection and highlighting for output
- Copy-to-clipboard functionality for commands
- Supports multiple command/output pairs
- Consistent styling with FileExplorer component
- Dark theme optimized for code display

---

## Using Components

All components are automatically available in any deck without manual imports. They can be used directly in markdown slides:

```markdown
# My Slide

<Callout type="info">
This is a callout!
</Callout>

<Terminal command="echo 'Hello'" />
```

Components support all Vue directives like `v-click`, `v-motion`, and more:

```html
<Callout type="warning" v-click>
This appears after a click.
</Callout>
```

