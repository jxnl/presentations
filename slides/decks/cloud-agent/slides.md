---
theme: default
title: Cloud Agent CLI
fonts:
  sans: 'Open Sans'
  provider: google
info: |
  ## Cloud Agent CLI
  AI agents that work on GitHub repos
class: text-left
mdc: true
transition: none
---

# Cloud Agent CLI

AI agents that work on GitHub repos

<div class="mt-8">
<a href="https://twitter.com/jxnlco" target="_blank" class="inline-flex items-center gap-2 text-xl">
  <carbon:logo-twitter class="text-2xl" />
  @jxnlco
</a>
</div>

<!--
Welcome to Cloud Agent CLI. This is a tool that lets you launch AI agents to work on GitHub repositories. They can read code, make changes, create branches, and open PRs - all while you focus on other work.
-->

---

# What is cloud-agent?

A CLI tool that launches AI agents to work on GitHub repositories

<v-clicks>

- Read and understand your codebase
- Make code changes
- Create branches and open PRs
- Work in parallel on different tasks

</v-clicks>

<div v-click>

**You review and merge the PRs yourself.**

</div>

<!--
Cloud-agent is a CLI tool that launches AI agents to work on your GitHub repositories.

[click] These agents can read and understand your codebase.

[click] They can make code changes.

[click] They create branches and open PRs automatically.

[click] And you can launch multiple agents to work in parallel on different tasks.

[click] The key point: you still review and merge the PRs yourself. You're in control.
-->

---

# The Problem

<!-- Click 1 -->
<div v-click>

**Small tasks pile up**

</div>

<!-- Click 2 -->
<v-clicks>

- Bug fixes, refactors, test coverage
- Context switching is expensive
- Hard to parallelize your own work

</v-clicks>

<!-- Click 5 -->
<div v-click>

**Solution: Offload to agents**

</div>

<!-- Click 6 -->
<v-clicks>

- Launch multiple agents on different tasks
- They work in parallel while you focus
- Review PRs when ready

</v-clicks>

<!--
Let's talk about the problem cloud-agent solves.

[click] Small tasks pile up.

[click] Bug fixes, refactors, test coverage.

[click] Context switching is expensive. Every time you switch tasks, you lose momentum.

[click] And it's hard to parallelize your own work - you can only focus on one thing at a time.

[click] The solution: offload these tasks to agents.

[click] Launch multiple agents on different tasks.

[click] They work in parallel while you focus on what matters.

[click] Then review PRs when they're ready.
-->

---

# How Agents Work

<AgentView 
  :events="[
    { type: 'status', content: 'Reading plan file...' },
    { 
      type: 'files-read',
      content: 'Reading plan:',
      files: [
        { path: 'plan/fix-null-pointer.md', lines: 15 }
      ]
    },
    { type: 'status', content: 'Analyzing codebase...' },
    { type: 'files-explored', exploredCount: 12 },
    { 
      type: 'files-read',
      content: 'Reading relevant files:',
      files: [
        { path: 'src/services/UserService.ts', lines: 45 },
        { path: 'tests/services/UserService.test.ts', lines: 67 }
      ]
    },
    { type: 'thought', content: 'Found the issue on line 23 - accessing user.name without null check.' },
    { type: 'files-edited', editedCount: 2 },
    { 
      type: 'tool-call',
      title: 'Running Tests',
      content: 'npm test -- UserService.test.ts'
    },
    { 
      type: 'tool-result',
      content: 'All tests passed!'
    },
    { 
      type: 'assistant',
      content: 'Fixed the null pointer exception. Added test case. Opening PR...'
    }
  ]"
  :height="480"
/>

<!--
Here's how agents work. Watch this agent in action.

The agent starts by reading the plan file you provide. It understands what needs to be done.

Then it analyzes your codebase, exploring files to understand the structure.

It reads the relevant files - in this case, the UserService and its tests.

The agent identifies the issue - accessing user.name without a null check.

It makes the necessary edits - fixing the bug and adding a test case.

Then it runs the tests to verify everything works.

Finally, it opens a PR with all the changes.

This entire workflow happens automatically. You just provide the plan.
-->

---

# Plans

Plans are markdown files that describe what you want done:

```markdown {1|3-4|6-8|10-11|all}
# Fix Null Pointer in UserService

## Goal
Fix crash when user is null in getUser()

## Tasks
- Add null check before accessing user properties
- Add test case for null user scenario

## Expected Outcome
No more crashes, tests pass
```

<!--
Plans are simple markdown files that describe what you want done.

You give it a title - what you're trying to fix or implement.

[click] Define the goal - what problem are you solving?

[click] List the tasks - what steps need to happen.

[click] And specify the expected outcome - how will you know it's done?

[click] That's it. Simple markdown. No complex syntax. Just describe what you want.
-->

---

# Organizing Plans

<FileExplorer dir="cloud-agent/example-plans" />

<div v-click>

Store plans in a `plan/` directory. Add `AGENTS.md` for project-specific instructions.

</div>

<!--
Here's how you organize plans in your repository.

[click] Store plans in a plan directory. You can organize them by type - bugs, features, refactors.

You can also add an AGENTS.md file for project-specific instructions. This helps agents understand your codebase conventions, testing patterns, and coding standards.
-->

---

# Agent Workflow in Action

<AgentView 
  query="user: find some low hanging fruit in this repo"
  :events="[
    { type: 'status', content: 'Scanning codebase for quick wins...' },
    { type: 'files-explored', exploredCount: 42 },
    { 
      type: 'files-read',
      content: 'Analyzing code patterns:',
      files: [
        { path: 'src/utils/helpers.py', lines: 67 },
        { path: 'src/api/auth.py', lines: 89 },
        { path: 'src/components/LoginForm.tsx', lines: 45 },
        { path: 'src/components/PasswordReset.tsx', lines: 38 }
      ]
    },
    { 
      type: 'assistant',
      content: 'Found three opportunities:\n\n1. **Replace print statements with logging** - 23 print() calls\n2. **Add LoginForm tests** - No test coverage\n3. **Add PasswordReset tests** - No test coverage\n\nThese touch different files, so can run in parallel.'
    },
    { 
      type: 'user',
      content: 'Create plans and kick them off.'
    },
    { 
      type: 'tool-call',
      title: 'Bash',
      content: 'cloud-agent launch --plan plan/replace-prints.md'
    },
    { 
      type: 'tool-call',
      title: 'Bash',
      content: 'cloud-agent launch --plan plan/add-login-tests.md'
    },
    { 
      type: 'tool-call',
      title: 'Bash',
      content: 'cloud-agent launch --plan plan/add-password-tests.md'
    },
    { 
      type: 'tool-result',
      content: 'Agent bc_prints_789 launched\nAgent bc_login_456 launched\nAgent bc_password_123 launched'
    },
    { 
      type: 'assistant',
      content: 'All three agents launched. They will work in parallel and each open a PR when done.'
    }
  ]"
  :height="430"
/>

<!--
Here's a more advanced workflow. You can ask an agent to find opportunities in your codebase.

The agent scans your code, analyzes patterns, and identifies quick wins - things like replacing print statements with logging, or adding missing tests.

Notice how the agent identifies that these tasks touch different files, so they can run in parallel.

You can then have the agent create plans and launch multiple agents to work on them simultaneously.

All three agents launch and work in parallel, each opening a PR when done.

This is the power of parallelization - multiple agents working on different parts of your codebase at the same time.
-->

---

# Quick Start

<!-- Click 1 -->
<div v-click>

<Terminal 
  :lines="[
    { command: '# Install', prompt: '$' },
    { command: 'npm install -g cloud-agent', prompt: '$' }
  ]"
/>

</div>

<!-- Click 2 -->
<div v-click>

<Terminal 
  :lines="[
    { command: '# Set API key (from cursor.com/settings)', prompt: '$' },
    { command: 'export CURSOR_API_KEY=your-key-here', prompt: '$' }
  ]"
/>

</div>

<!-- Click 3 -->
<div v-click>

<Terminal 
  :lines="[
    { command: '# Launch an agent', prompt: '$' },
    { command: 'cloud-agent launch --plan plan.md', prompt: '$' }
  ]"
/>

</div>

<!-- Click 4 -->
<div v-click class="mt-4">

Auto-detects repository and branch from your current git directory.

</div>

<!--
Here's how to get started with cloud-agent.

[click] First, install it globally with npm.

[click] Set your API key from cursor.com/settings. This authenticates the agents.

[click] Then launch an agent with a plan file.

[click] Cloud-agent automatically detects your repository and branch from your current git directory, so you don't need to specify them manually.
-->

---

# Key Rule: File Overlap

<!-- Click 1 -->
<div v-click>

**Only launch agents that modify different files**

</div>

<!-- Click 2 -->
<div v-click class="grid grid-cols-2 gap-8 mt-8">
<div>

**OK to parallelize:**

- Agent 1: `src/auth.ts`
- Agent 2: `src/api.ts`
- Agent 3: `src/utils.ts`

</div>
<div>

**NOT OK:**

- Agent 1: `src/auth.ts`
- Agent 2: `src/auth.ts`

</div>
</div>

<!-- Click 3 -->
<div v-click class="mt-4 text-center">

Same file = run sequentially

</div>

<!--
There's one key rule you need to understand: file overlap.

[click] Only launch agents that modify different files.

[click] Here's what's OK to parallelize - agents working on different files. And here's what's NOT OK - multiple agents modifying the same file. On the left, three agents working on three different files. On the right, two agents trying to modify the same file - that's a conflict.

[click] Same file means you need to run them sequentially, not in parallel.

This is the most important rule for using cloud-agent effectively. Make sure agents work on different files.
-->

---

# Useful Commands

<!-- Click 1 -->
<div v-click>

<Terminal 
  :lines="[
    { command: '# Wait for agent to finish', prompt: '$' },
    { command: 'cloud-agent watch [agent-id]', prompt: '$' }
  ]"
/>

</div>

<!-- Click 2 -->
<div v-click>

<Terminal 
  :lines="[
    { command: '# Send additional instructions', prompt: '$' },
    { command: 'cloud-agent followup [agent-id] --messages &quot;Add tests&quot;', prompt: '$' }
  ]"
/>

</div>

<!-- Click 3 -->
<div v-click>

<Terminal 
  :lines="[
    { command: '# List your agents', prompt: '$' },
    { command: 'cloud-agent list', prompt: '$' }
  ]"
/>

</div>

<!--
Here are some useful commands for managing your agents.

[click] Use watch to monitor an agent's progress in real-time. This shows you what the agent is doing as it works.

[click] Use followup to send additional instructions to a running agent. Maybe you want to add tests, or change the approach.

[click] Use list to see all your active agents and their status.

These commands help you stay in control and monitor what your agents are doing.
-->

---
layout: center
---

# Try It Out

<QRCode url="https://github.com/jxnl/cloud-cursor-agent" size="300" caption="github.com/jxnl/cloud-cursor-agent" />

<div class="mt-8 text-center">

`npm install -g cloud-agent`

</div>

<!--
That's cloud-agent. Scan the QR code to visit the GitHub repository, or install it with npm install -g cloud-agent.

Try it out on your own repositories. Start with small tasks - bug fixes, adding tests, refactoring. Get comfortable with how agents work, then scale up to more complex tasks.

Remember: agents work best when they have clear plans and work on different files. You're still in control - review the PRs and merge when ready.

Thanks for watching!
-->
