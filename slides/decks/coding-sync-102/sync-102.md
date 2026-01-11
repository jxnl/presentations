# Sync Agents 102: Commands, Skills & Tools

## Overview

**Agents 102 focuses on turning behaviors into commands, skills, and explaining what they do.**

This course takes the patterns from Agents 101 and codifies them into reusable commands and skills that make your workflow repeatable and scalable. We'll cover:

1. **Foundation:** AGENTS.md configuration and infrastructure setup
2. **Codification:** Custom commands, skills, and toolkits
3. **Workflows:** Planning, context loading, and execution patterns
4. **Quality:** Testing, verification, and code review

**Important:** By this point, your team should have already defined or identified your AI champion. Some of the setup and configuration covered in this course requires their involvement, particularly for creating and managing custom commands that standardize workflows across your team.

This document extracts advanced synchronous workflow patterns from study materials. These workflows require active attention and typically run for 20 seconds to a few minutes, maintaining flow state and enabling rapid iteration.

### What You Learned in Sync Agents 101

**Sync Agents 101 covered the fundamentals of synchronous agent workflows: taking meeting notes, asking questions to understand requirements, and creating implementation plans.** You learned to capture meeting notes (using tools like Granola or Wispr Flow), feed them to agents to extract context, ask clarifying questions to refine understanding, and turn the results into structured plan.md files. This foundation of live coding and effective prompting sets the stage for Agents 102, where we codify these patterns into reusable commands and skills.

---

## Part 1: Foundation

## AGENTS.md Files: Configuration and Organization

### What Are AGENTS.md Files?

AGENTS.md files (also called `agents.md`, `.cursorrules`, or `claude.md` depending on the tool) are configuration files that provide always-on context to AI agents. They contain rules, preferences, and patterns that guide how agents should behave when working in your codebase. These files are automatically loaded into every agent conversation, ensuring consistent behavior across your team.

**Key Characteristics:**

- **Always-on context:** Rules are loaded into every agent chat automatically
- **Minimal by design:** Start with nothing, add only when needed
- **Living documentation:** Updated whenever agents make mistakes or patterns emerge
- **Tool-agnostic:** Most tools now support `agents.md` or `AGENTS.md` naming

### Philosophy: Start Minimal, Build Gradually

**Don't create AGENTS.md upfront.** The best approach is to start without any agent file and only add instructions when the model consistently makes wrong choices. This prevents over-engineering and keeps your configuration focused on actual problems.

**When to add rules:**

- Model fails 2-3 times on the same issue
- Team identifies repeated patterns that need standardization
- Tool preferences need to be documented (pnpm vs npm, test modes, etc.)
- Code style conventions that differ from defaults

**What to document:**

- Tool preferences (pnpm vs npm, uv vs pip)
- Test behavior (watch vs non-watch mode)
- Style guidelines specific to your codebase
- Common patterns that the model gets wrong consistently
- Examples of correct code patterns (tag existing code examples)

**Avoid:**

- Thousand-line templates copied from the internet
- Rules for things that already work correctly
- Over-explaining patterns that are obvious from context

### Directory-Specific AGENTS.md Files

For monorepos and large codebases, directory-specific AGENTS.md files are essential. Agents automatically pick up the correct file based on the working directory, allowing you to have different rules for different parts of your codebase.

**Example nested structure:**

```text
repo-root/
  AGENTS.md          # Root-level rules (tool preferences, general patterns)
  docs/
    AGENTS.md        # Docs-specific rules (markdown style, formatting)
  frontend/
    AGENTS.md        # Frontend-specific rules (React patterns, component structure)
  backend/
    AGENTS.md        # Backend-specific rules (API conventions, database patterns)
  tests/
    AGENTS.md        # Testing-specific rules (test structure, mocking patterns)
```

**How it works:**

- Agents look for `AGENTS.md` in the current working directory first
- If not found, they check parent directories up to the repo root
- The closest file takes precedence, allowing nested overrides
- Each directory can have rules specific to that codebase section

**Use cases for directory-specific files:**

- **Monorepos:** Different rules for frontend vs backend vs docs
- **Mixed codebases:** Python in one directory, TypeScript in another
- **Team boundaries:** Different teams with different conventions
- **Legacy code:** Special rules for older parts of the codebase

**Best practices:**

- Keep root-level AGENTS.md minimal (shared tool preferences only)
- Put specific rules in directory-specific files
- Reference parent rules when appropriate ("Follow root AGENTS.md, plus...")
- Use clear, descriptive names that indicate scope

### Symlinking AGENTS.md Files Across Tools

Many teams use multiple AI coding tools (Cursor, Claude Desktop, Codex CLI, etc.). To maintain consistency, you can symlink AGENTS.md files so updates propagate across all tools.

**Symlinking Agent Files:**

- Cursor reads both `.claude/` and `.cursor/` directories
- Symlink AGENTS.md files (shared rules) across both directories
- Copy commands and skills directories (independent copies needed)
- Manual setup steps:
  - Create `.claude/` and `.cursor/` directories
  - Symlink AGENTS.md and .cursorrules (shared)
  - Copy commands/ and skills/ directories (independent)
  - Ensures both Cursor and agent CLIs can access agent files

### Maintaining AGENTS.md Through PR Reviews

**Critical Practice: Update AGENTS.md During PR Reviews**

As you review pull requests, you should actively look for mistakes that indicate the agent needs better instructions. This is one of the most important practices for improving agent behavior over time.

**When reviewing PRs:**

- **Identify agent mistakes:** Look for patterns where the agent made incorrect choices, used wrong patterns, or misunderstood requirements
- **Update AGENTS.md immediately:** Don't just fix the code - add a rule to AGENTS.md that prevents the mistake from happening again
- **Tag @.agent in PRs:** When you spot agent-generated code that needs correction, tag @.agent to signal this should inform future instructions
- **Make it part of the PR process:** Include AGENTS.md updates as part of your code review checklist

Teams that practice this consistently see dramatic improvements over time. This is "Compounding Engineering" - each PR review becomes an opportunity to teach the agent, and those lessons compound week over week.

**Example workflow:**

1. Review PR and notice agent used wrong testing pattern
2. Fix the code in the PR
3. Add rule to AGENTS.md: "When writing tests for API endpoints, use [correct pattern] instead of [wrong pattern]"

**Why this matters:**

- Update AGENTS.md whenever agent does something incorrectly
- Team contributes to AGENTS.md multiple times a week
- Each correction prevents future mistakes
- Over time, AGENTS.md becomes a comprehensive guide to your codebase patterns

---

## Infrastructure Setup for Agent Self-Correction

When agents can verify their work for correctness, they can run for much longer and with high reliability. Type systems, linters, formatters, and tests give agents the tools they need to check their own output, catch mistakes early, and self-correct without human intervention.

### Key Concepts

**Linting** is the process of running a program (called a linter) that analyzes your code for potential errors, style issues, and suspicious patterns. Linters catch problems like unused variables, inconsistent formatting, or code that might cause bugs. Common linters include ESLint for JavaScript, Ruff for Python, and Prettier for formatting. When agents have access to linters, they can check their own work and fix issues before you ever see them.

**[Wispr Flow](https://wisprflow.ai/r?JASON50)** is a voice dictation tool that runs in the background on your computer. You speak naturally, and it transcribes your words into whatever text field you're focused on. For AI-assisted coding, voice input is roughly 3x faster than typing and produces richer context. Instead of typing terse prompts, you can talk through your thinking in detail. Use code **JASON50** for a discount.

**Pre-commit hooks** are scripts that run automatically before you commit code to Git. They act as a safety net that catches problems early. A typical pre-commit hook might run the linter, check for formatting issues, and run quick tests. If any check fails, the commit is blocked until you fix the problem. For agents, pre-commit hooks provide immediate feedback on whether their code meets your standards.

**The self-healing loop:** When these tools are configured, agents can verify and correct their own work. The agent writes code, runs the linter or tests, reads any error messages, fixes the issues, and runs the checks again. This loop continues until all checks pass. An agent might iterate dozens of times on a single task, getting closer to correct code with each cycle. The tools provide the feedback that lets agents see their own mistakes and fix them without your involvement.

### Self-Healing Repositories

- Setting up repos so agents can fix their own errors is important
- Type systems, linters, formatters, and tests help agents find context and fix their own mistakes
- All the things engineers have complained about (types, linters, formatters, tests) are now essential for agent self-healing
- Intentional repository structure dramatically improves Codex navigation and parallel task execution
- Consider how folder names and code organization help AI tools navigate efficiently

### Pre-commit Hooks and CI

- Tell AI: "Set up pre-commit hooks with ruff format, ruff check, and mypy"
- AI will configure everything - the .pre-commit-config.yaml, the pyproject.toml settings, even the GitHub Actions workflow
- What you get: auto-formatting with your linter, type checking, tests that only run for changed files
- What this prevents: those Friday afternoon disasters where obvious mistakes make it to production

**Example Setup (Jason's Projects):**

- Pre-commit hooks and pre-push hooks configured
- AI can't push a pull request unless tests pass
- Human developers can still push with `--no-verify` when needed

### Team Rollout

- Single AGENTS.md in repo root (one source of truth)
- Pre-commit + CI enforce rules automatically
- Only add new rules when same mistake happens twice
- Teach agents to read AGENTS.md before making changes

**Self-Assessment Questions:**

- How complete are your tests? Do you have pre-commit hooks?

---

## Part 2: Codification

## Custom Commands and Slash Commands

### Command Philosophy

Custom slash commands automate entire PR workflow and turn repeated AI instructions into reusable commands. Commands represent codified experience - every time you give AI the same instructions, turn it into a command. After three months, a well-built toolkit handles 90% of repetitive cleanup. The goal: never have the same conversation with AI twice.

**The Importance of the AI Champion:** The AI champion is responsible for creating new commands and managing the team's command library. This ensures consistency, prevents duplicate commands, and maintains quality standards. As teams identify repeated patterns and workflows, the AI champion codifies them into reusable commands that benefit everyone.

### Core Commands (Jason's Git-Focused Toolkit)

Since Jason works extensively with Git workflows, these core commands focus on automating Git-related tasks:

- `/de-slop` - Removes AI artifacts (redundant comments, temp files, mock-heavy tests)
- `/gh-commit` - Groups changes into logical commits automatically (`feat` → `test` → `docs` → `refactor` → `chore`)
- `/gh-fix-ci` - Downloads CI logs and fixes failures automatically (Ruff, tests, type errors)
- `/gh-review-pr` - Reviews PRs with structured feedback
- `/gh-address-pr-comments` - Addresses PR feedback systematically

These commands are available at [github.com/jxnl/dots](https://github.com/jxnl/dots/tree/master/claude) and can be copied directly to your `.cursor/commands/` or `.claude/commands/` folder.

### Async PR Review Workflow

One powerful workflow combines `/gh-address-pr-comments` and `/gh-fix-ci` for async code review:

1. **Agent creates PR:** Tell your coding agent to create a pull request at the end of its task
2. **Review remotely:** Get GitHub notifications on your phone/tablet, review the PR, and leave comments
3. **Address feedback:** When you're back at your computer, run `/gh-address-pr-comments` - it uses the GitHub CLI to fetch line-by-line comments from GitHub and addresses them systematically
4. **Fix CI:** Run `/gh-fix-ci` to download CI logs and fix any test failures or linting errors

This workflow is particularly useful because `/gh-address-pr-comments` uses the GitHub CLI to fetch comments per line from GitHub, so you can review and comment on PRs remotely without needing to be at your computer. When you return, both PR comments and CI errors get addressed automatically.

### Example Command

**`/gh-commit` command file:**

```markdown
# Commit

Create small, logical commits with conventional commit messages.

## Steps

1. Safety
git branch --show-current
- If on `main`/`master`: stop and create a branch: `git checkout -b feat/short-desc`

2. Inspect changes
git status --porcelain
git diff --stat

3. Batch changes (typical: `feat|fix`, then `test`, then `docs`, then `refactor/chore`)
- Keep commits atomic
- Do not mix unrelated concerns
- Never `git add .`

4. Stage + commit each batch
git add path/to/file1 path/to/file2
git commit -m "type(scope): short description"

5. Summary
git log --oneline -10
git diff --stat origin/$(git remote show origin | awk '/HEAD branch/ {print $NF}')...HEAD
```

### Team-Specific Commands

Beyond these core Git-focused commands, teams should create usage-specific commands for their own patterns and workflows. These might include:

- **Deploy patterns:** Commands that handle complex deployment workflows, environment-specific configurations, or multi-step deployment processes
- **Testing patterns:** Commands that run specific test suites, set up test environments, or execute complex testing workflows beyond simple test execution
- **Domain-specific workflows:** Commands tailored to your team's specific needs, such as database migrations, API contract validation, or infrastructure provisioning

The AI champion should identify these repeated patterns and codify them into commands. If a workflow is more complex than running a single command, that's exactly the kind of pattern that should become a custom command. This ensures consistency and reduces the cognitive load of remembering multi-step processes.

**What workflows do you have at your company that could be built as custom commands?**

Think about the repetitive tasks you do every week. The conversations you keep having with AI. The cleanup steps that always happen before you ship. Those are your next commands.

### Case Study: PlanetScale's Changelog Command

PlanetScale's engineering team uses Cursor commands to automate their changelog workflow. Each time they ship a feature, they publish an update on their changelog - a markdown file in a Git repository that gets published to their website and RSS feed.

The format is specific and the context (documentation) already exists in the repo. This makes it a perfect use case for a command.

**Their approach to building commands:**

1. Complete a task with Cursor normally
2. At the end of the conversation, ask Cursor to create a command for the process
3. Run the command a few times, tweaking it when results aren't satisfactory
4. After a couple iterations, the workflow becomes reliable

**Example prompt to create a command:**

> Please create a new Cursor command for the process we just went through, so that it is easy to replicate in the future for others. Call it `/updateapi`.

**Their `/changelog` command structure:**

```markdown
## Create a changelog

This command creates a new changelog entry following PlanetScale's established format and style guidelines.

### Changelog Format Requirements

**File Structure:**
- Filename: `kebab-case-title.md` (descriptive, lowercase with hyphens)
- Location: `content/changelog/`

**Frontmatter:**
---
title: 'Human-readable title'
category: 'Feature|Enhancement|Bug Fix'
createdAt: 'YYYY-MM-DD'
---

**Content Guidelines:**
- **Concise**: 1-3 paragraphs maximum
- **Consistent**: Examine recent similar changelogs to understand format
- **Simple language**: Avoid jargon, be conversational
- **Clear scope**: Explicitly mention if feature is platform-specific
- **External links**: Link to relevant documentation when available
```

**Bonus: Slack Integration**

PlanetScale also triggers their changelog command from Slack. A team member can message a Slack bot, which kicks off Cursor to open a pull request automatically. The human only needs to review and merge.

This demonstrates the full lifecycle: identify a repeated pattern, codify it into a command, iterate until reliable, then integrate it into team workflows.

Source: [PlanetScale Engineering Blog](https://planetscale.com/blog/automating-with-cursor-commands)

---

## Skills and Toolkits

If you've been following AI development, you've probably heard a lot about MCP servers. While they're great for tools that are provided from other people, if you're the sole consumer of a tool, it might not make sense to use an MCP server. Instead, consider using command line scripts.

One thing that has been gaining a lot of popularity is to define agent skills, which is similar to commands but has a lot more structure.

### How Agent Skills Work

Use agent skills to extend Codex with task-specific capabilities. A skill packages instructions, resources, and optional scripts so Codex can follow a workflow reliably. You can share skills across teams or with the community. Skills build on the [open agent skills standard](https://openskills.space/).

Skills are available in both the Codex CLI and IDE extensions. OpenAI maintains an [official skills catalog](https://github.com/openai/skills) with curated and experimental skills you can install directly into Codex.

**Agent Skill Definition:**

A skill captures a capability expressed through Markdown instructions in a `SKILL.md` file. A skill folder can also include scripts, resources, and assets that Codex uses to perform a specific task.

```text
my-skill/
  SKILL.md          # Required: instructions + metadata
  scripts/          # Optional: executable code
  references/       # Optional: documentation
  assets/           # Optional: templates, resources
```

**Progressive Disclosure:**

Skills use progressive disclosure to manage context efficiently. At startup, Codex loads the name and description of each available skill. Codex can then activate and use a skill in two ways:

- **Explicit invocation:** You include skills directly in your prompt. To select one, run the `/skills` slash command, or start typing `$` to mention a skill. Codex web and iOS don't support explicit invocation yet, but you can still ask Codex to use any skill checked into a repo.

**Benefits:**

- **Task-specific capabilities:** Extend Codex with domain-specific workflows
- **Shareable:** Share skills across teams or with the community
- **Structured:** More organized than simple commands with clear metadata and resources
- **Efficient:** Progressive disclosure keeps context manageable

**Skill Examples:**

Skills can be as simple as wrapping a single utility or as complex as orchestrating multi-step workflows:

- **QR code generator:** A skill that creates QR codes for links - useful for blog posts, presentations, or documentation
- **YouTube transcript extractor:** A skill that uses the YouTube API to get video transcripts automatically
- **FFmpeg video editing:** A skill that packages your preferences for using ffmpeg - specific formats, quality settings, or workflow patterns you prefer

More importantly, skills package the preferences of the developer, not just the command-line knowledge. The agent might already know how to use ffmpeg, but there are still specific things that you want to steer - your preferred video formats, quality settings, output locations, or workflow patterns. Skills capture these preferences so Codex follows your way of doing things, not just the tool's default behavior.

Skills can also power verification workflows. For example, an eval runner skill can let agents test their own prompt changes against a local evaluation suite, read the results, and iterate. We'll cover this pattern in Part 4 (Quality & Verification).

### Toolkit Philosophy

AI coding is about creating code you'd never give yourself time to write. Those "nice to have" scripts you've thought about but never prioritized? AI can build them in 15 minutes while you're in a meeting.

**Test Data Generation:**

Instead of manually writing INSERT statements or basic fixtures, agents can analyze your database schema, understand relationships and constraints, and generate realistic test data. Thorsten needed test data for a thread starring feature - he told the agent to "use psql, look at the database, see how threads work, and make some test threads." The agent examined the schema, created valid test data, fixed its own mistakes when it hit type errors, and delivered usable results.

**Throwaway Development Utilities:**

Agent-generated code is cheap, making throwaway tools cost-effective. Tim Devereaux had an agent create UI state toggles to quickly switch between component variations while designing - invaluable for rapid iteration, then easily removed before shipping. These are the debug panels, feature flag toggles, and configuration editors you always wanted but never prioritized.

### Where to Put Commands, Skills, and Prompts

| Type | Location | Sharing | Invocation |
|------|----------|---------|------------|
| **Commands** | `.cursor/commands/` or `.claude/commands/` | Repo (shared with team) | Explicit (`/command-name`) |
| **Skills** | `~/.codex/skills/` or repo `.codex/skills/` | Local or repo-level | Explicit (`$skill`) or implicit |
| **Prompts** | `~/.codex/prompts/` | Local only (not shared) | Explicit only |

**Commands** live in your repo, so they're version-controlled and shared with your team. Everyone who clones the repo gets the same commands.

**Skills** can be local (in your home directory) or repo-level. Local skills are personal utilities. Repo-level skills are shared with your team. Skills can be invoked explicitly or the agent can activate them implicitly when relevant.

**Prompts** are local-only and require explicit invocation. They live in your Codex home directory (`~/.codex/prompts/`), so they're not shared through your repository. If you want to share a prompt or want the agent to implicitly invoke it, convert it to a skill instead.

**When to use each:**

- **Command:** Team workflow you want everyone to use the same way (e.g., `/gh-commit`)
- **Skill:** Complex capability with scripts/resources, optionally shared (e.g., eval runner)
- **Prompt:** Personal reusable guidance you don't need to share (e.g., your PR drafting style)

---

## MCP Servers for Synchronous Workflows

### The Practical Reality

MCP servers connect AI agents to external tools. The promise: eliminate context switching by letting agents read from Linear, Notion, Figma, etc. The reality: for most workflows, copy-pasting into Cursor works fine.

**The must-have:** Ticketing system integration. Install the Linear MCP directly in Cursor ([linear.app/docs/mcp](https://linear.app/docs/mcp)) and tell it to make Linear tickets. That's it.

**Tip:** Create a custom command for making Linear tickets. The command can automatically assign the right people, projects, labels, and priority based on the context.

### Finding MCP Servers

**Smithery** ([smithery.ai](https://smithery.ai/)) is a marketplace with over 3,400 MCP apps and integrations. You can browse by category (Developer Tools, Memory, Web Search, Finance, etc.) and find pre-built connections for services like Google Calendar, Notion, Slack, Figma, Jira, and more. Smithery also hosts "skills" - packaged instructions and workflows that extend agent capabilities for specific tasks like frontend design, prompt engineering, or presentation creation.

---

## Part 3: Workflows

## Planning Workflows

### Planning as Primary Work

- Planning is now half the work
- As coding automates, planning and testing become primary bottlenecks
- Start with empty agent files, build up gradually
- Use structured planning formats (Exec Plans) for complex projects
- Ask agents to explain systems before changes - loads context effectively
- Planning tools (Deep Wiki, Code Maps) accelerate codebase understanding

### Recommended Workflow: Plan, Explore, Code, Verify

- Synchronous planning: use fast IDE tools to understand codebase, ask questions, create task specs
- Asynchronous coding: delegate implementation to agents that work on their own while you plan next task
- Synchronous testing: test and refine agent's changes using IDE tools for quick iteration
- Continuous cycle: while one agent codes, you're planning next task and testing completed work

### File-Based Planning for Large Features

While both Claude Codex and Cursor have plan modes, which are good for small features, for larger features I prefer to use the file system. Example instructions:

```md
Make plans in `.plans/{feature-name}/plan.md` with structured markdown including phases, clear feature branch names, mentioned files to reference, steps, decision log, components, and interfaces.

Ask me clarifying questions until you feel good about the plan. Create phased plans with clear feature branch names and mentioned files to reference. Break work into distinct phases, each with its own feature branch name. Each phase should clearly list the files that need to be referenced or modified. Use git history to understand changes made and track the evolution of the codebase.

As you work on the feature, add notes to `.plans/learnings.md` that document your progress, decisions made, issues encountered, and context needed to pick up where you left off.
```

You can choose to add `.plans` to `.gitignore` or not, depending on whether you want to track planning artifacts in version control.

Then, as I approve this plan, I have the agent research the codebase to clarify any additional questions. You can use git history to understand how the code has changed over time. Personally, I find it reasonable to have plans that are 500, 600, or even a thousand lines long. More interestingly, if the implementation is wrong, I just delete the entire code, iterate on the plan, and rebuild it.

### Voice-Driven Planning

- Use Wispr Flow to dictate thoughts while exploring codebase
- Talking through understanding is 3x faster than typing and gives much richer context
- Questions to guide discovery:
  - "What files in our codebase are relevant to this?"
  - "What are different ways we could implement this?"
  - "What are the trade-offs of each approach?"
  - "Are there edge cases I should consider?"
  - "What similar patterns exist in our code?"

---

## Context Loading and File Management

### Context Loading Through Questions

- Ask agents to explain systems to you rather than explaining systems to them
- This effectively loads context into agent's window while ensuring relevant information is prioritized
- Asking agents to explain something forces them to read and understand relevant code
- Avoids over-explaining or under-explaining by letting agent determine what's relevant
- Functions as "read-only" context loading mechanism before making changes
- Similar to teaching technique where you ask students what they think, and they often answer their own questions

**Examples:**

- **UI component conventions:** Daniel would ask "Explain how these UI components are built and what the common conventions are" even though he already knew the answer. This forced amp to read all relevant component files and load that context before making changes

**Technical Details:**

- Ask questions like "How does [feature/system] work?" or "What are the patterns in [codebase area]?"
- Agent will read relevant files, analyze patterns, and synthesize explanation
- This loads all that information into context for subsequent operations
- Works with any agent system, not just amp-specific tools

### Understanding Large Codebases

- **Use agents to understand**: Existing codebases before making changes
- **Add log statements**: At key logic points to follow execution flow through complex systems
- **Ask for feature outlines**: Map system dependencies
- **Natural language interfaces**: Query codebases conversationally
- **New engineer onboarding**: Ask coding tools about codebase instead of waiting for domain experts
- **Spend time understanding**: Features before writing code

**Examples:**

- **Feature exploration**: Ask "What is this feature? What systems is it using?" and the agent pulls all relevant files and provides a natural language outline
- **Log statement debugging**: Audrey asks agent to put log statements at key logic points to follow execution flow through complex systems
- **New engineer onboarding**: Instead of waiting for the occasional domain expert, new engineers ask coding tools about the codebase and get immediate, accurate answers

**Technical Details:**

- Query agents with questions like "How does [feature] work?" or "What files implement [system]?"
- Ask for architectural outlines before implementation work
- Request log statements at critical points for execution tracing
- Feed the agent's explanation directly into your coding agent as context
- Use tools like Source Graph's natural language search for comprehensive codebase understanding

### File Organization for AI Navigation

- Use unique project codenames that don't appear elsewhere in codebase (e.g., "wam" for Codex project)
- Enables effective ripgrep usage for fast navigation
- Multiple example folders allow parallel work without conflicts
- Code duplication more acceptable when AI manages overhead
- Repository structure matters: use unique, searchable names for projects
- Multiple example folders allow parallel work without conflicts (agents won't run into each other)
- Can kick off 3 tasks to update different folders simultaneously without git conflicts
- Using pnpm workspaces with separate package.json files per project prevents dependency issues
- Use git worktrees for working on same files with different agents

**Technical Details:**

- Use pnpm workspace structure for separate dependencies per example
- Separate package.json files prevent dependency conflicts
- Git worktrees remain valid option for branch-level isolation

---

## Sequential Workflows and Sub-Agents

### Sequential Over Parallel

- Run sub-agents sequentially rather than managing many concurrent agents
- Use small context windows for focused tasks that hand off to next agent in sequence
- Sequential workflows are less stressful and more reliable than managing concurrent agents
- Break features into independent sub-tasks: plan, implement, write tests, run tests, fix failures
- Each agent completes its work and hands output to next agent
- Avoids context window bloat by keeping each agent focused on one aspect
- Prevents concurrent agents from working against each other or creating conflicts
- Key principle: Sequence over concurrency for real agent workflows

**Examples:**

- **Agent MD file workflow:** Mike Hossetler structures his agent MD file to define sub-agents that work sequentially:
  1. Plan feature agent reads requirements and creates implementation plan
  2. Implementation agent writes the code
  3. Test writing agent creates test suite
  4. Test runner agent executes tests
  5. Failure fix agent resolves any issues
- Each agent finishes completely before next begins, with clear handoff points defined

**Technical Details:**

- Define sub-agents in agent MD files with clear inputs and outputs
- Specify what each agent should produce for next agent in chain
- Use small context windows for each focused task
- Avoid parallelization unless tasks are truly independent with no shared state
- Hand off artifacts (code, test results, logs) between sequential agents

### Context-Free Sub-Agent Workflows

- **Sub-agents for data exploration**: Process logs, errors, metrics without loading into main context
- **Log data analysis**: Create sub-agent to analyze application logs, identify slow functions/files, and report findings back
- **Complex UI debugging**: Sub-agent processes verbose debug output from UI rendering to identify root causes
- **Main agent stays focused**: On code while sub-agent handles data exploration
- **Sub-agent summarizes**: Findings in concise format for main agent

**Examples:**

- **Log data analysis**: Create sub-agent to analyze application logs, identify slow functions or files, and report findings back. Sub-agent runs CLI commands to process logs and identifies performance bottlenecks
- **Complex UI debugging**: Sub-agent processes verbose debug output from UI rendering to identify root causes

**Technical Details:**

- Spawn sub-agents specifically for data analysis tasks
- Sub-agent uses appropriate CLI tools to process logs, metrics, or traces
- Sub-agent summarizes findings in concise format for main agent
- Keeps main agent's context window free for code operations

---

## Part 4: Quality & Verification

## Making Work Testable

- Giving Codex tools to verify its own work dramatically improves output quality and success rate
- Tests don't have to mean unit tests - any verification mechanism works
- Codex trained to verify its work like a senior engineer
- Verification tools enable self-correction during execution
- Visual verification particularly powerful for UI work
- Linters, tests, snapshots all help Codex validate output

**Technical Details:**

- Codex accepts image inputs as context when starting tasks
- Can use screenshots, Figma designs, UI mockups as specifications
- Linters and traditional tests work alongside visual verification

### Case Study: Agent-Driven Prompt Optimization

As many of you know, I'm also an AI engineer, and most of my time is spent prompt engineering and building out evals. One of the great things Cursor has enabled is building CLI tools that agents can use to verify and iterate on their own work.

**The setup:**

1. **Eval runner CLI** - A small CLI tool that runs evals given a prompt
2. **SQLite storage** - Instead of saving evals to a cloud provider, results write to a local SQLite database

By packaging these two tools as a skill, Cursor can:

- Run an eval against the current prompt
- Read the results from SQLite
- Query results by run ID, scores, or other metrics using the SQLite CLI
- Analyze what's working and what's failing
- Iterate on the prompt based on the results
- Run the eval again to verify improvements

**The key insight:**

The agent becomes the optimization loop. Instead of writing code to automate prompt iteration, the agent IS the optimization loop. It runs evals, reads results, makes changes, and runs again - all using the CLI tools you've provided. No additional code required.

This pattern works because:

- The eval runner gives the agent a way to test its changes
- SQLite gives the agent a way to query and analyze historical results
- The agent can see scores, identify failing cases, and make targeted improvements
- Each iteration is grounded in real eval data, not guesswork

**Why local tooling matters:**

Cloud-based eval platforms are great for team collaboration and historical tracking. But for rapid iteration during development, local CLI tools let the agent work faster. There's no API latency, no authentication complexity, and the agent can query results however it needs using standard SQLite commands.

---

## Real API Testing Over Fixtures

- Use real-time API calls in tests rather than static JSON fixtures
- Let agents hit actual APIs to catch real-world bugs and edge cases
- Static fixtures become outdated and don't reveal actual API behavior changes
- Real API calls catch bugs that mock data will never expose
- Agents can handle creating, testing, and tearing down real resources
- More expensive in API costs but catches actual integration issues

**Examples:**

- **Fly.io API client:** Mike Hossetler built Elixir client for Fly.io's API where tests actually created servers, waited for them to boot, and then tore them down. Agents ran tests against real infrastructure, caught edge cases, and self-corrected using actual logs

**Technical Details:**

- Create test specs that provision real resources (servers, databases, etc.)
- Implement proper teardown to clean up resources after tests
- Use actual API responses instead of fixtures
- Agents use real logs and errors to debug and self-correct
- Results in higher API costs but better test coverage

---

## Autonomous Debugging Workflows

- Tell agents what you want fixed, not how to fix it
- Let them figure out their own testing and logging approach
- Agents have seen tons of code patterns that most developers haven't
- Trust agents to make their own debugging tools (scripts, logs, setup)
- Agents will make their own helper tools like bash scripts, log files, and test configs

**Examples:**

- **Node project debugging:** Last Hackathon Someone asked agent to debug Node project without specifying methodology. Agent autonomously:
  - Wrote bash script for testing
  - Created and cleared log files before each run
  - Set appropriate environment variables for testing
  - Used Node instead of Bun when appropriate
  - Wrote output to structured log files
  - Published results identifying failing issue

**Technical Details:**

- Agents will create bash scripts for automated testing workflows
- They set up logging infrastructure including file clearing and output redirection
- Environment variables get configured appropriately for test vs production contexts
- Log files are organized and named systematically for easy analysis

---

## Code Review

### Review Commands and Workflows

- Both Codex and Cursor have custom models specifically trained for code review
- Codex: `/review` command for local code review
- Cursor: "Find Issues" feature for code review
- Both offer installable GitHub bots for automatic PR reviews

**Technical Details:**

- `/review` can run on specific code sections locally before push
- GitHub automatic reviews don't spam - prioritize significant issues over nitpicks
- Separate review thread prevents bias from previous conversation context
- Can create custom review commands for specific team standards

---

## Automated Meta Workflows

- **Fast feedback loops**: With AI tools can create messy codebases at scale
- **Automating cleanup**: Prevents technical debt
- **Pre-commit hooks**: Can catch outdated documentation and suggest updates
- **Reduces cognitive load**: Of remembering to update related documentation

**Examples:**

- **Pre-commit documentation scanner**: Colleen Shows created a script that runs before commits and:
  - Scans changed files
  - Suggests appropriate commit messages
  - Detects which docs and PRDs are now outdated
  - Prompts to update or archive affected documentation
- **Pull request generator**: Having agents read completed work and generate comprehensive PR descriptions automatically

**Technical Details:**

- Implement as pre-commit hooks or git hooks
- Script should scan staged files and detect changes
- Compare changed files against documentation references
- Suggest commit messages based on actual changes
- Prompt for doc updates with specific files that need attention
- Can integrate with PR creation workflows

---

## Appendix: Browser Control

Cursor's browser control capabilities let agents interact with web pages directly, enabling visual debugging, testing, and design iteration without leaving your editor.

**Key Features:**

- **Computer use mode**: Embedded browser for visual debugging and design iteration
- **Screenshot capture**: Agents can take screenshots of pages to verify UI changes
- **DOM interaction**: Agents can click buttons, fill forms, and interact with page elements
- **Console access**: Agents can read console logs and errors from the browser
- **Visual verification**: Compare before/after screenshots to verify fixes

**Workflow Example:**

1. Code a React component with styling changes
2. Agent opens browser and navigates to your local dev server
3. Agent takes screenshot of the current state
4. Agent makes code changes based on visual feedback
5. Agent takes new screenshot and compares with original
6. Agent verifies the fix matches requirements

Browser control pairs well with the toolkit philosophy - agents can build admin pop-ups, debug panels, feature flag toggles, and configuration UIs, then immediately test them visually.

---
