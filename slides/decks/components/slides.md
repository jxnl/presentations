---
theme: default
title: Custom Components Showcase
fonts:
  sans: 'Open Sans'
  provider: google
info: |
  Showcase of custom components available in Slidev presentations
class: text-left
mdc: true
transition: none
---

# Custom Components

A showcase of reusable components for Slidev presentations

<div class="mt-8">
<a href="https://twitter.com/jxnlco" target="_blank" class="inline-flex items-center gap-2 text-xl">
  <carbon:logo-twitter class="text-2xl" />
  @jxnlco
</a>
</div>

<!--
Welcome! This deck showcases all the custom components we've built for Slidev presentations.
These components are automatically available in all decks without manual imports.
-->

---
layout: two-cols
layoutClass: gap-16
---

# QR Code Component

Generate QR codes dynamically in your slides

## Basic Usage

<div class="text-center">

<QRCode url="https://sli.dev" size="150" />

</div>

```html
<QRCode url="https://sli.dev" size="150" />
```

::right::

## With Caption

<div class="text-center">

<QRCode url="https://sli.dev" size="150" caption="Scan to visit Slidev documentation" />

</div>

```html
<QRCode 
  url="https://sli.dev" 
  size="150" 
  caption="Scan to visit Slidev documentation" 
/>
```

<!--
QR codes are super useful for presentations - you can add them at the end of your slides so people can easily access links, resources, or follow-up materials.

The component accepts a URL, optional size, and optional caption. QR codes are generated dynamically when the slide loads.
-->

---
---

# Callout Component

Highlight important information with styled callout boxes

## Info Callout

<Callout type="info">
This is an informational callout with helpful context. Use it to provide additional information or tips.
</Callout>

```html
<Callout type="info">
This is an informational callout with helpful context.
</Callout>
```

## Warning Callout

<Callout type="warning" title="Important">
Make sure to save your work before proceeding with this operation.
</Callout>

```html
<Callout type="warning" title="Important">
Make sure to save your work before proceeding.
</Callout>
```

## Success Callout

<Callout type="success">
Operation completed successfully! All changes have been saved.
</Callout>

```html
<Callout type="success">
Operation completed successfully!
</Callout>
```

## Error Callout

<Callout type="error" title="Error">
Something went wrong. Please check your connection and try again.
</Callout>

```html
<Callout type="error" title="Error">
Something went wrong. Please try again.
</Callout>
```

<!--
Callouts are perfect for drawing attention to important information. They come in six types: info, warning, success, error, tip, and note.

Each type has its own color scheme and icon. You can optionally add a title prop for more context.
-->

---
---

# More Callout Types

## Tip Callout

<Callout type="tip" title="Pro Tip">
Use keyboard shortcuts to navigate faster. Press Space or Arrow keys to advance slides.
</Callout>

```html
<Callout type="tip" title="Pro Tip">
Use keyboard shortcuts to navigate faster.
</Callout>
```

## Note Callout

<Callout type="note" title="Note">
This is a general note callout. Use it for additional context or documentation references.
</Callout>

```html
<Callout type="note" title="Note">
This is a general note callout.
</Callout>
```

## All Types Together

<div class="space-y-3 mt-4">

<Callout type="info">Info callout</Callout>
<Callout type="warning">Warning callout</Callout>
<Callout type="success">Success callout</Callout>
<Callout type="error">Error callout</Callout>
<Callout type="tip">Tip callout</Callout>
<Callout type="note">Note callout</Callout>

</div>

<!--
Here are the remaining callout types - tip and note. Tip is great for helpful hints, and note is useful for general documentation-style notes.

You can see all six types displayed together here. Each has distinct colors and icons to make them easily distinguishable.
-->

---
---

# Callout Props

## Available Types

- `info` - Blue, informational content
- `warning` - Yellow, important warnings
- `success` - Green, success messages
- `error` - Red, error messages
- `tip` - Purple, helpful tips
- `note` - Gray, general notes

## Props

- `type` (optional, default: 'info') - One of the six types listed above
- `title` (optional) - Title text displayed above the content

## Usage with Click Animations

<!-- Click 1 -->
<Callout type="info" v-click>
This callout appears after the first click.
</Callout>

<!-- Click 2 -->
<Callout type="warning" v-click>
This warning appears after the second click.
</Callout>

<!-- Click 3 -->
<Callout type="success" v-click>
This success message appears after the third click.
</Callout>

<!--
Callouts work great with click animations. You can reveal them progressively as you discuss different points.

Here we have three callouts that appear one after another with each click, demonstrating how they can be used to build up information step by step.
-->

---
layout: center
---

# Data Visualization

Modern charts for your presentation

---
---

# Bar Chart

<Chart 
  type="bar" 
  title="Quarterly Revenue (2024)"
  :labels="['Q1', 'Q2', 'Q3', 'Q4']"
  :datasets="[
    { 
      label: 'Revenue', 
      data: [12.5, 19.2, 15.8, 24.3] 
    },
    { 
      label: 'Profit', 
      data: [4.2, 8.5, 5.1, 10.2] 
    }
  ]"
  :height="400"
/>

<!--
Here's a standard bar chart. Notice how the colors are automatically applied if you don't specify them. 
Grid lines are subtle, and the font is clean and modern.
-->

---
---

# Line Chart (Growth)

<Chart 
  type="line"
  title="Active Users Growth"
  :labels="['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun']"
  :datasets="[{ 
    label: 'Active Users', 
    data: [1200, 1350, 1600, 2100, 2800, 3500],
    fill: true 
  }]"
  :height="400"
/>

<!--
Line charts are great for showing trends over time.
We've enabled smooth curves (tension) and area fill by default to make it look more modern.
-->

---
---

# Doughnut Chart

<Chart 
  type="doughnut"
  title="Device Distribution"
  :labels="['Mobile', 'Desktop', 'Tablet', 'Other']"
  :datasets="[{ 
    data: [45, 30, 15, 10],
    backgroundColor: ['#3B82F6', '#10B981', '#F59E0B', '#6366F1']
  }]"
  :height="400"
/>

<!--
Doughnut charts are perfect for showing proportions. 
The legend is automatically positioned at the bottom with circular indicators.
-->

---
---

# File Explorer

<FileExplorer dir="components/example_fs/fastapi-app" />

```html
<FileExplorer dir="components/example_fs/fastapi-app" />
```

<!--
The FileExplorer component allows you to explore a file system structure directly within your slides. 
It's great for code walkthroughs, showing project structures, or exploring configuration files.
You can click on files to view their content and expand/collapse directories.
-->

---
layout: center
class: text-center
---

# Component Usage

All components are automatically available in any deck

- No manual imports needed
- Located in `slides/components/`
- Use directly in markdown slides
- Support Vue directives and props

<div class="mt-8">

<carbon:logo-github class="text-4xl" />

</div>

<div class="mt-4">

[Documentation](https://sli.dev) · [GitHub](https://github.com/slidevjs/slidev)

</div>

<!--
That's a wrap! All these components are automatically available in any deck you create. They're located in the slides/components directory and Slidev's auto-import feature makes them available without any manual imports.

Just use them directly in your markdown slides with Vue syntax. They support all Vue directives like v-click, v-motion, and more.
-->
