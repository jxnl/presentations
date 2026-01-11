---
theme: default
title: "Sync Agents 102: Commands, Skills & Tools"
fonts:
  sans: 'Open Sans'
  provider: google
info: |
  Sync Agents 102: Commands, Skills & Tools
class: text-left
mdc: true
transition: none
---

# Sync Agents 102

Commands, Skills & Tools

<!--
Welcome to Sync Agents 102. This is day 2, morning session.

In 101 you learned the fundamentals: taking meeting notes, asking questions, creating plans. Today we codify those patterns into reusable commands and skills.

The key message: these capabilities exist for when you need them. Don't overthink it upfront. As you use AI more, make mistakes, and repeat yourself - that's when you reach for these tools.
-->

---

# What We'll Cover

1. **Foundation:** AGENTS.md configuration and infrastructure setup
2. **Codification:** Custom commands, skills, and toolkits
3. **Workflows:** Planning, context loading, and execution patterns
4. **Quality:** Testing, verification, and code review

<!--
Four parts today.

Foundation covers AGENTS.md files and setting up your repo so agents can self-correct.

Codification is about turning repeated behaviors into reusable commands and skills.

Workflows covers planning patterns, loading context, and using sub-agents.

Quality is about testing, verification, and code review.

The real benefits come from good tests and infrastructure. Everything else builds on that foundation.
-->

---

# What You Learned in Sync 101

**The fundamentals of synchronous agent workflows:**

- Capturing meeting notes (Granola, Wispr Flow)
- Feeding notes to agents to extract context
- Asking clarifying questions to refine understanding
- Turning results into structured plan.md files

**Today:** We codify these patterns into reusable commands and skills.

<!--
Quick recap of 101.

You learned to capture meeting notes with tools like Granola or Wispr Flow. Feed those notes to agents to extract context. Ask clarifying questions. Turn the results into structured plan files.

That was about live coding and effective prompting. Today we make those patterns repeatable and scalable.
-->

---
layout: section
---

# Part 1: Foundation

AGENTS.md and Infrastructure

<!--
Part 1 is about foundation. Two things: AGENTS.md files and infrastructure that lets agents self-correct.
-->

---

# What Are AGENTS.md Files?

Configuration files that provide always-on context to AI agents.

- **Always-on context:** Rules loaded into every agent chat automatically
- **Minimal by design:** Start with nothing, add only when needed
- **Living documentation:** Updated when agents make mistakes
- **Tool-agnostic:** Most tools support `agents.md` or `AGENTS.md`

<!--
AGENTS.md files are configuration files that guide how agents behave in your codebase.

They're always-on - rules get loaded into every conversation automatically.

They should be minimal. Start with nothing. Only add rules when the model consistently makes wrong choices.

They're living documentation - you update them whenever agents make mistakes.

Most tools now support this naming convention.
-->

---

# Philosophy: Start Minimal

**Don't create AGENTS.md upfront.** Add instructions only when needed.

**When to add rules:**
- Model fails 2-3 times on the same issue
- Team identifies repeated patterns that need standardization
- Tool preferences need documenting (pnpm vs npm, etc.)

**What to document:**
- Tool preferences (pnpm vs npm, uv vs pip)
- Test behavior (watch vs non-watch mode)
- Style guidelines specific to your codebase
- Common patterns the model gets wrong

<!--
The philosophy is start minimal.

Don't create AGENTS.md upfront. Add rules only when the model consistently makes wrong choices. If it fails 2-3 times on the same issue, that's when you add a rule.

Document tool preferences - pnpm vs npm, uv vs pip. Test behavior. Style guidelines specific to your codebase. Patterns the model gets wrong.

Avoid thousand-line templates copied from the internet. Avoid rules for things that already work correctly.
-->

---

# Directory-Specific AGENTS.md

For monorepos, use directory-specific files. Agents check the current directory first, then parents up to root.

<FileExplorer dir="coding-sync-102/example_fs/monorepo-example" />

<!--
For monorepos and large codebases, use directory-specific AGENTS.md files.

Agents look for AGENTS.md in the current working directory first. If not found, they check parent directories up to the repo root.

This lets you have different rules for frontend vs backend vs docs. Each team can have their own conventions.

Keep root-level minimal - just shared tool preferences. Put specific rules in directory-specific files.
-->

---

# Maintaining AGENTS.md Through PR Reviews

**Critical Practice:** Update AGENTS.md during code reviews.

1. Review PR and notice agent made incorrect choice
2. Fix the code in the PR
3. Add rule to AGENTS.md to prevent the mistake

**This is "Compounding Engineering"** - each PR review teaches the agent, and those lessons compound over time.

<!--
This is one of the most important practices.

When reviewing PRs, look for mistakes that indicate the agent needs better instructions. Don't just fix the code - add a rule to AGENTS.md that prevents the mistake from happening again.

This is compounding engineering. Each correction prevents future mistakes. Over time, AGENTS.md becomes a comprehensive guide to your codebase patterns.

Teams that practice this see dramatic improvements over weeks and months.
-->

---

# Infrastructure for Agent Self-Correction

When agents can verify their work, they can run longer and more reliably.

<AgentView query="Add input validation to the signup form" :events="[{ type: 'status', content: 'Implementing validation logic...' }, { type: 'files-edited', editedCount: 1 }, { type: 'tool-call', title: 'Committing changes', content: 'git commit -m feat: add signup validation' }, { type: 'tool-result', content: 'pre-commit hook failed: ruff check: F401 re imported but unused' }, { type: 'status', content: 'Fixing pre-commit failures...' }, { type: 'files-edited', editedCount: 1 }, { type: 'tool-call', title: 'Committing changes', content: 'git commit -m feat: add signup validation' }, { type: 'tool-result', content: 'pre-commit hook passed - [feature/validation 3a2b1c0]' }, { type: 'assistant', content: 'Validation added and committed. Pre-commit caught an unused import - fixed.' }]" :height="380" />

<!--
Infrastructure is the real foundation.

When agents can verify their own work, they can run for much longer with high reliability. Type systems, linters, formatters, and tests give agents tools to check their output.

The self-healing loop: agent writes code, runs linter or tests, reads errors, fixes issues, runs again. This continues until all checks pass.

An agent might iterate dozens of times on a single task. The tools provide feedback that lets agents see their own mistakes and fix them.
-->

---

# What Enables Self-Healing?

- **Linting:** ESLint, Ruff, Prettier catch errors and style issues
- **Type systems:** TypeScript, mypy catch type errors
- **Formatters:** Consistent code style agents can follow
- **Tests:** Verify behavior matches expectations
- **Pre-commit hooks:** Block commits until checks pass

All the things engineers have complained about are now essential for agent self-healing.

<!--
What enables self-healing?

Linting catches errors and style issues. Type systems catch type errors before runtime. Formatters ensure consistent style. Tests verify behavior.

Pre-commit hooks block commits until checks pass - agents can't push a PR unless tests pass.

All the things engineers have complained about - types, linters, formatters, tests - are now essential for agent self-healing. They're not just for humans anymore.
-->

---

# Understanding Git Hooks

**Three checkpoints for catching issues:**

| Hook | When | What to Run |
|------|------|-------------|
| **Pre-commit** | Before each commit | Fast checks: formatting, linting |
| **Commit-msg** | After commit message | Validate commit message format |
| **Pre-push** | Before pushing | Slower checks: type checking, fast tests |

Agents can't push unless all checks pass. Humans can bypass with `--no-verify`.

<!--
Understanding the different Git hooks helps you structure your checks.

Pre-commit runs before each commit. Use it for fast checks - formatting and linting. These should complete in seconds.

Commit-msg runs after you write your commit message. Use it to validate commit message format if you follow conventions.

Pre-push runs before pushing to remote. This is where you put slower checks - type checking and fast tests. These can take 30 seconds to a minute.

Agents can't push a PR unless all checks pass. Human developers can still push with --no-verify when they need to, but agents follow the rules.
-->

---

# Fast CI is Essential

**If your test suite takes 40 minutes, that's a separate problem.**

Code is cheap now. Slow feedback loops kill velocity.

**Split your tests:**
- **Fast tests (< 2 min):** Unit tests, smoke tests - run on every push
- **Slow tests (> 2 min):** Integration tests, E2E - run on PR, nightly, or manually

Pre-push hooks should only run fast tests. Save slow tests for CI.

<!--
Fast CI is essential. If your test suite takes 40 minutes, that's a separate problem you need to solve.

Code is cheap now. Agents can write code quickly. But if every change takes 40 minutes to verify, you've bottlenecked on feedback loops.

Split your tests. Fast tests - unit tests, smoke tests - should run in under 2 minutes. Run these on every push. Slow tests - integration tests, E2E tests - run these on PR creation, nightly, or manually.

Pre-push hooks should only run fast tests. Save the slow tests for CI where they can run in parallel with your work.
-->

---

# Audit Your Setup

**Prompts to give Cursor for a first audit:**

"Audit our testing infrastructure. What percentage of our codebase has test coverage? Which areas are untested?"

"Look at our CI pipeline. How long does it take? Which tests are slowest? How could we split fast vs slow tests?"

"Check if we have pre-commit hooks. If not, set up pre-commit with ruff format and ruff check."

"Review our AGENTS.md file. What's missing? What patterns do we follow that aren't documented?"

<!--
Here are prompts you can give Cursor to audit your setup.

First, audit your testing infrastructure. Ask what percentage has coverage, which areas are untested.

Second, look at your CI pipeline. How long does it take? Which tests are slowest? How could you split them?

Third, check if you have pre-commit hooks. If not, have the agent set them up.

Fourth, review your AGENTS.md file - or create one if it doesn't exist. What patterns do you follow that aren't documented?

These prompts give you a starting point. The agent will read your codebase and give you specific recommendations.
-->

---
layout: section
---

# Part 2: Codification

Custom Commands, Skills & Tools

<!--
Part 2 is about codification. Turning repeated behaviors into reusable commands and skills.
-->

---

# The AI Champion Role

**Your team needs an AI champion.**

The AI champion is responsible for:
- Creating new commands and managing the command library
- Ensuring consistency and preventing duplicate commands
- Maintaining quality standards
- Codifying repeated patterns into reusable commands

Some setup covered today requires their involvement.

<!--
Before we dive into commands, let's talk about the AI champion role.

Your team should have already identified an AI champion by this point. This person creates new commands, manages the command library, ensures consistency, and maintains quality standards.

Some of the setup and configuration we'll cover requires their involvement. Particularly for creating and managing custom commands that standardize workflows across your team.
-->

---

# Custom Slash Commands

**Commands represent codified experience.**

Every time you give AI the same instructions, turn it into a command.

After three months, a well-built toolkit handles 90% of repetitive cleanup.

**The goal:** Never have the same conversation with AI twice.

<!--
Custom slash commands automate entire workflows.

The philosophy is simple: every time you give AI the same instructions, turn it into a command. Commands represent codified experience.

After three months of building commands, a well-built toolkit handles 90% of repetitive cleanup.

The goal: never have the same conversation with AI twice.
-->

---

# Core Git Commands

Commands that automate Git-related tasks:

- `/de-slop` - Remove AI artifacts (redundant comments, mock-heavy tests)
- `/gh-commit` - Group changes into logical commits (feat, test, docs, refactor, chore)
- `/gh-fix-ci` - Download CI logs and fix failures automatically
- `/gh-review-pr` - Review PRs with structured feedback
- `/gh-address-pr-comments` - Address PR feedback systematically

Available at: github.com/jxnl/dots

<!--
Here are some core commands I use for Git workflows.

de-slop removes AI artifacts - redundant comments, temp files, mock-heavy tests.

gh-commit groups changes into logical commits automatically - features first, then tests, then docs.

gh-fix-ci downloads CI logs and fixes failures - Ruff errors, test failures, type errors.

gh-review-pr reviews PRs with structured feedback.

gh-address-pr-comments addresses PR feedback systematically.

These are all available at my dots repo on GitHub. You can copy them directly.
-->

---

# Example: /gh-commit Command

```markdown
# Commit

Create small, logical commits with conventional commit messages.

## Steps

1. Safety
   git branch --show-current
   - If on `main`/`master`: stop and create a branch

2. Inspect changes
   git status --porcelain
   git diff --stat

3. Batch changes (feat|fix, then test, then docs, then refactor/chore)
   - Keep commits atomic
   - Never `git add .`

4. Stage + commit each batch
   git add path/to/file1 path/to/file2
   git commit -m "type(scope): short description"
```

<!--
Here's what a command file looks like. This is gh-commit.

It starts with a title and description. Then steps.

First, safety check - don't commit to main. Second, inspect changes. Third, batch changes by type - features first, then tests, then docs, then refactor or chore. Fourth, stage and commit each batch.

Commands are just markdown files with structured instructions. Simple but powerful.
-->

---

# Async PR Review Workflow

Combining commands for async code review:

1. **Agent creates PR:** Tell your agent to create a PR at the end of its task
2. **Review remotely:** Get GitHub notifications on phone, review and leave comments
3. **Address feedback:** Run `/gh-address-pr-comments` - fetches line-by-line comments
4. **Fix CI:** Run `/gh-fix-ci` to download logs and fix failures

Review PRs remotely, address everything when you're back at your desk.

<!--
Here's a powerful workflow combining commands.

Agent creates a PR at the end of its task. You review remotely on your phone and leave comments. When you're back at your computer, run gh-address-pr-comments - it uses the GitHub CLI to fetch comments per line and addresses them systematically. Then run gh-fix-ci to fix any test failures.

You can review and comment on PRs from anywhere. When you return, both PR comments and CI errors get addressed automatically.
-->

---

# Team-Specific Commands

Beyond Git commands, create usage-specific commands for your team:

- **Deploy patterns:** Complex deployment workflows, multi-step processes
- **Testing patterns:** Specific test suites, environment setup
- **Domain-specific workflows:** Database migrations, API validation, infrastructure

**Question:** What workflows do you have that could become commands?

Think about repetitive tasks, repeated AI conversations, cleanup steps before shipping.

<!--
Beyond Git commands, create team-specific commands.

Deploy patterns for complex deployment workflows. Testing patterns for specific test suites. Domain-specific workflows for database migrations, API validation, whatever your team does repeatedly.

Think about it: what workflows do you have at your company that could be built as custom commands?

The repetitive tasks you do every week. The conversations you keep having with AI. The cleanup steps before you ship. Those are your next commands.
-->

---

# Case Study: PlanetScale's Changelog

PlanetScale uses Cursor commands to automate changelog entries.

**Their approach:**
1. Complete a task with Cursor normally
2. At the end, ask Cursor to create a command for the process
3. Run the command a few times, tweak when needed
4. After iterations, the workflow becomes reliable

**Prompt:** "Create a new Cursor command for the process we just went through, call it /changelog"

<!--
Case study: PlanetScale's engineering team.

Each time they ship a feature, they publish a changelog entry. The format is specific, the context exists in the repo. Perfect use case for a command.

Their approach: complete a task normally, then ask Cursor to create a command for it. Run it a few times, tweak when results aren't right. After a couple iterations, it becomes reliable.

They even trigger the command from Slack - a team member messages a bot, which opens a PR automatically.
-->

---

# Skills and Toolkits

**Skills are like commands, but more structured.**

A skill packages instructions, resources, and scripts:

```text
my-skill/
  SKILL.md          # Required: instructions + metadata
  scripts/          # Optional: executable code
  references/       # Optional: documentation
  assets/           # Optional: templates, resources
```

Skills use progressive disclosure - loaded by name/description, activated when needed.

<!--
Skills are similar to commands but with more structure.

A skill folder contains a SKILL.md file with instructions, plus optional scripts, references, and assets.

Skills use progressive disclosure. At startup, only the name and description are loaded. The full skill activates when you invoke it or when the agent determines it's relevant.

OpenAI maintains an official skills catalog you can install from.
-->

---

# Skill Examples

Skills package your preferences, not just tool knowledge:

- **QR code generator:** Create QR codes for blog posts, presentations
- **YouTube transcript extractor:** Get video transcripts automatically
- **FFmpeg video editing:** Your preferred formats, quality settings, workflow patterns

The agent might know ffmpeg, but skills capture how YOU want to use it.

<!--
Skills can be simple or complex.

QR code generator creates QR codes for links. YouTube transcript extractor gets video transcripts automatically. FFmpeg video editing packages your preferences for video work.

The key insight: skills package YOUR preferences, not just tool knowledge. The agent might already know how to use ffmpeg. But there are still specific things you want to steer - your preferred formats, quality settings, workflow patterns.

Skills capture these preferences so the agent follows your way of doing things.
-->

---

# The Toolkit Philosophy

AI coding is about creating code you'd never give yourself time to write.

**Test data generation:**
- "Use psql, look at the database, see how threads work, make some test threads"
- Agent examines schema, creates valid data, fixes its own mistakes

**Throwaway utilities:**
- UI state toggles to switch between component variations
- Debug panels, feature flag toggles, configuration editors
- Invaluable for iteration, easily removed before shipping

<!--
The toolkit philosophy: AI makes "nice to have" scripts actually happen.

Test data generation - instead of writing INSERT statements manually, tell the agent to analyze your schema and generate realistic data. It'll examine relationships, create valid data, fix its own mistakes.

Throwaway utilities - those debug panels, feature flag toggles, configuration editors you always wanted but never prioritized. Agent-generated code is cheap. Build them for rapid iteration, remove before shipping.

These are the 15-minute scripts AI can build while you're in a meeting.
-->

---

# Where to Put Commands, Skills, and Prompts

| Type | Location | Sharing | Invocation |
|------|----------|---------|------------|
| **Commands** | `.cursor/commands/` | Repo (team) | Explicit (`/name`) |
| **Skills** | `~/.codex/skills/` or repo | Local or shared | Explicit or implicit |
| **Prompts** | `~/.codex/prompts/` | Local only | Explicit only |

**Rule of thumb:** If you want to share it, use commands or repo-level skills. If it's personal, use prompts or local skills.

<!--
Quick reference for where things go.

Commands live in your repo, so they're version-controlled and shared with your team.

Skills can be local or repo-level. Local skills are personal utilities. Repo-level skills are shared. Skills can be invoked explicitly or the agent can activate them implicitly.

Prompts are local-only and require explicit invocation. They live in your Codex home directory, not shared through your repo. If you want to share a prompt or want implicit invocation, convert it to a skill.
-->

---

# MCP Servers

**MCP servers connect AI agents to external tools.**

The promise: eliminate context switching by letting agents read from Linear, Notion, Figma, etc.

The reality: for most workflows, copy-pasting into Cursor works fine.

**The must-have:** Ticketing system integration.

Install Linear MCP in Cursor, tell it to make tickets. That's it.

<!--
MCP servers connect agents to external tools.

The promise is eliminating context switching - agents read from Linear, Notion, Figma directly.

The practical reality: for most workflows, copy-pasting into Cursor works fine. Don't over-engineer.

The must-have is ticketing integration. Install the Linear MCP, tell it to make tickets. Create a custom command for making tickets that automatically assigns the right people, projects, labels, and priority.

For finding more MCP servers, check out Smithery - it's a marketplace with over 3,400 integrations.
-->

---
layout: section
---

# Part 3: Workflows

Planning, Context & Execution

<!--
Part 3 covers workflows. How to plan effectively, load context, and execute with sub-agents.
-->

---

# Planning as Primary Work

**As coding automates, planning becomes the bottleneck.**

The recommended cycle:

1. **Synchronous planning:** Use IDE tools to understand codebase, ask questions, create specs
2. **Asynchronous coding:** Delegate implementation to agents
3. **Synchronous testing:** Test and refine agent's changes
4. **Continuous cycle:** While one agent codes, you're planning next task

<!--
Planning is now half the work.

As coding automates, planning and testing become the primary bottlenecks.

The recommended cycle: synchronous planning using fast IDE tools, then delegate implementation to agents running async, then synchronous testing to refine their work, and repeat.

While one agent codes, you're planning the next task and testing completed work. It's a continuous cycle.
-->

---

# File-Based Planning for Large Features

For larger features, use the file system:

```markdown
Make plans in `.plans/{feature-name}/plan.md` with:
- Phases with clear feature branch names
- Files to reference
- Steps and decision log
- Components and interfaces

As you work, add notes to `.plans/learnings.md` documenting:
- Progress and decisions
- Issues encountered
- Context to pick up where you left off
```

Plans can be 500-1000 lines. If implementation is wrong, delete code, iterate on plan, rebuild.

<!--
While Cursor and Codex have plan modes for small features, for larger features I prefer using the file system.

Create plans in a .plans directory with structured markdown. Include phases, branch names, files to reference, steps, decision log.

As you work, add learnings to a separate file documenting progress, decisions, issues, and context for picking up later.

Plans can be 500 or even 1000 lines long. More interestingly, if the implementation is wrong, just delete the code, iterate on the plan, and rebuild it.
-->

---

# Voice-Driven Planning

**Talking is 3x faster than typing and gives richer context.**

Use Wispr Flow to dictate while exploring the codebase.

Questions to guide discovery:
- "What files in our codebase are relevant to this?"
- "What are different ways we could implement this?"
- "What are the trade-offs of each approach?"
- "Are there edge cases I should consider?"
- "What similar patterns exist in our code?"

<!--
Voice-driven planning is a game changer.

Use Wispr Flow or similar tools to dictate your thoughts while exploring the codebase. Talking is roughly 3x faster than typing and produces much richer context.

Instead of typing terse prompts, talk through your thinking in detail. Ask questions to guide discovery: what files are relevant, what implementation options exist, what are the trade-offs, what edge cases should I consider.

Use code JASON50 for a Wispr Flow discount.
-->

---

# Context Loading Through Questions

**Ask agents to explain systems to you, rather than explaining to them.**

This loads context while ensuring relevant information is prioritized.

Example: "Explain how these UI components are built and what the common conventions are"

Even if you already know the answer, this forces the agent to read all relevant files before making changes.

<!--
Context loading through questions is a powerful technique.

Instead of explaining your codebase to the agent, ask the agent to explain it to you. This forces the agent to read and understand relevant code, loading that context into its window.

Example: "Explain how these UI components are built." Even if you already know the answer, this makes the agent read all relevant component files.

It's like the teaching technique where you ask students what they think, and they often answer their own questions.
-->

---

# Understanding Large Codebases

**Use agents to understand before making changes:**

- Ask for feature outlines to map system dependencies
- Add log statements at key logic points to follow execution
- Ask "What is this feature? What systems is it using?"
- Use new engineer onboarding questions - agents give immediate answers

**Spend time understanding features before writing code.**

<!--
Large codebases can be intimidating. Use agents to understand them.

Ask for feature outlines that map system dependencies. Have agents add log statements at key logic points to follow execution flow.

Ask questions like "What is this feature? What systems is it using?" The agent pulls all relevant files and provides a natural language outline.

New engineers can ask coding tools about the codebase instead of waiting for domain experts. Immediate, accurate answers.
-->

---

# File Organization for AI Navigation

**Structure your repo for AI navigation:**

- Use unique project codenames that don't appear elsewhere (e.g., "wam")
- Enables effective ripgrep for fast navigation
- Multiple example folders allow parallel work without conflicts
- Use pnpm workspaces with separate package.json files

Code duplication is more acceptable when AI manages the overhead.

<!--
File organization matters for AI navigation.

Use unique project codenames that don't appear elsewhere in the codebase. This enables effective ripgrep usage for fast navigation.

Multiple example folders allow parallel work without conflicts. You can kick off 3 tasks to update different folders simultaneously without git conflicts.

Use pnpm workspaces with separate package.json files per project to prevent dependency issues.

Code duplication is more acceptable when AI manages the overhead.
-->

---

# Sequential Workflows and Sub-Agents

**Run sub-agents sequentially, not in parallel.**

Break features into independent sub-tasks:
1. Plan feature agent - creates implementation plan
2. Implementation agent - writes the code
3. Test writing agent - creates test suite
4. Test runner agent - executes tests
5. Failure fix agent - resolves issues

Each agent finishes completely before the next begins.

<!--
When using sub-agents, run them sequentially, not in parallel.

Break features into independent sub-tasks: planning, implementation, test writing, test running, failure fixing.

Each agent completes its work and hands output to the next agent. This avoids context window bloat by keeping each agent focused on one aspect.

It prevents concurrent agents from working against each other or creating conflicts. Sequence over concurrency for real agent workflows.
-->

---

# Context-Free Sub-Agent Workflows

**Use sub-agents for data exploration without loading into main context.**

- Log data analysis: identify slow functions, report findings
- Complex UI debugging: process verbose debug output
- Metrics analysis: process logs to identify bottlenecks

Main agent stays focused on code while sub-agent handles exploration.

Sub-agent summarizes findings in concise format.

<!--
Context-free sub-agents are useful for data exploration.

Create a sub-agent to analyze application logs, identify slow functions, and report findings back. The sub-agent runs CLI commands to process logs and identifies bottlenecks.

For complex UI debugging, a sub-agent processes verbose debug output to identify root causes.

The main agent stays focused on code while the sub-agent handles data exploration. The sub-agent summarizes findings in a concise format for the main agent.

This keeps the main agent's context window free for code operations.
-->

---
layout: section
---

# Part 4: Quality & Verification

Testing, Debugging & Review

<!--
Part 4 covers quality and verification. How to make work testable, debug autonomously, and review code effectively.
-->

---

# Making Work Testable

**Giving agents tools to verify their work dramatically improves output.**

Tests don't have to mean unit tests - any verification mechanism works:
- Linters and type checkers
- Snapshot tests
- Integration tests
- Visual verification (screenshots)

Verification tools enable self-correction during execution.

<!--
The foundation of quality is making work testable.

Giving agents tools to verify their work dramatically improves output quality and success rate. Agents are trained to verify their work like senior engineers.

Tests don't have to mean unit tests. Any verification mechanism works: linters, type checkers, snapshot tests, integration tests, visual verification through screenshots.

These tools enable self-correction during execution. The agent can see when something's wrong and fix it.
-->

---

# Case Study: Agent-Driven Prompt Optimization

**Building CLI tools agents can use to verify and iterate:**

1. **Eval runner CLI** - Runs evals given a prompt
2. **SQLite storage** - Results write to local SQLite database

The agent becomes the optimization loop:
- Run eval against current prompt
- Query results from SQLite
- Analyze what's working and failing
- Iterate on the prompt
- Run eval again to verify

<!--
Case study: agent-driven prompt optimization.

I built two CLI tools: an eval runner that runs evals given a prompt, and SQLite storage for results.

The agent becomes the optimization loop. It runs an eval, reads results from SQLite, queries results by run ID or scores, analyzes what's working and failing, iterates on the prompt, and runs the eval again.

No additional code required. The agent IS the optimization loop, using the CLI tools you've provided.

This pattern works because the tools give the agent ways to test changes and see results.
-->

---

# Real API Testing Over Fixtures

**Use real-time API calls in tests, not static JSON fixtures.**

- Static fixtures become outdated
- Real API calls catch bugs mock data never exposes
- Agents can create, test, and tear down real resources

**Example:** Fly.io API client tests actually created servers, waited for boot, then tore them down.

More expensive in API costs, but catches actual integration issues.

<!--
Consider real API testing over fixtures.

Static JSON fixtures become outdated and don't reveal actual API behavior changes. Real API calls catch bugs that mock data will never expose.

Agents can handle creating, testing, and tearing down real resources.

Example: An Elixir client for Fly.io's API where tests actually created servers, waited for them to boot, then tore them down. Agents ran tests against real infrastructure, caught edge cases, and self-corrected using actual logs.

It's more expensive in API costs, but catches actual integration issues.
-->

---

# Autonomous Debugging

**Tell agents what you want fixed, not how to fix it.**

Let them figure out their own approach:
- They'll write bash scripts for testing
- Create and clear log files before each run
- Set appropriate environment variables
- Write output to structured log files

**Trust agents to make their own debugging tools.**

Agents have seen tons of code patterns most developers haven't.

<!--
Autonomous debugging means telling agents what you want fixed, not how to fix it.

Let them figure out their own testing and logging approach. They'll make their own helper tools - bash scripts, log files, test configs.

One example: an agent asked to debug a Node project autonomously wrote a bash script for testing, created and cleared log files before each run, set environment variables appropriately, used Node instead of Bun when needed, and wrote output to structured log files.

Trust agents to make their own debugging tools. They've seen tons of code patterns most developers haven't.
-->

---

# Code Review

**Both Codex and Cursor have specialized review capabilities:**

- Codex: `/review` command for local code review
- Cursor: "Find Issues" feature
- Both offer installable GitHub bots for automatic PR reviews

**Create custom review commands for specific team standards.**

Reviews prioritize significant issues over nitpicks.

<!--
Code review has specialized tooling.

Both Codex and Cursor have custom models trained specifically for code review. Codex has a /review command for local review. Cursor has "Find Issues" feature.

Both offer installable GitHub bots for automatic PR reviews on every push. The automatic reviews are smart - they prioritize significant issues over nitpicks.

You can create custom review commands for specific team standards. Run review on specific code sections locally before pushing.
-->

---

# Automated Meta Workflows

**Automate cleanup to prevent technical debt:**

Pre-commit documentation scanner:
- Scans changed files
- Suggests appropriate commit messages
- Detects which docs and PRDs are now outdated
- Prompts to update or archive affected documentation

Pull request generator:
- Agents read completed work
- Generate comprehensive PR descriptions automatically

<!--
Automated meta workflows prevent technical debt.

Fast feedback loops with AI tools can create messy codebases at scale. Automating cleanup prevents that debt from accumulating.

Example: a pre-commit documentation scanner that scans changed files, suggests commit messages, detects which docs are now outdated, and prompts to update them.

Another example: a PR generator that reads completed work and generates comprehensive PR descriptions automatically.

These reduce cognitive load - you don't have to remember to update related documentation.
-->

---

# Browser Control

**Cursor's browser control enables visual debugging:**

- Embedded browser for visual debugging and design iteration
- Screenshot capture to verify UI changes
- DOM interaction - click buttons, fill forms
- Console access for reading logs and errors
- Visual verification - compare before/after screenshots

**Workflow:** Code changes, agent opens browser, takes screenshot, verifies fix matches requirements.

<!--
Browser control in Cursor enables visual debugging.

You get an embedded browser for visual debugging and design iteration. Agents can take screenshots, interact with DOM elements - clicking buttons, filling forms. They can read console logs and errors.

The workflow: make code changes, agent opens browser and navigates to your dev server, takes a screenshot, makes adjustments based on visual feedback, takes another screenshot and compares with the original, verifies the fix matches requirements.

Browser control pairs well with the toolkit philosophy. Build admin pop-ups, debug panels, feature flag toggles - then immediately test them visually.
-->

---
layout: section
---

# Key Takeaways

<!--
Let's wrap up with the key takeaways from today.
-->

---

# The Core Message

**These capabilities exist for when you need them.**

Don't overthink it upfront. As you use AI more:

- You'll make mistakes - add rules to AGENTS.md
- You'll repeat yourself - turn it into a command
- You'll see patterns - codify them into skills

**The real benefits come from good tests and infrastructure.**

Everything else builds on that foundation.

<!--
The core message for today.

These capabilities exist for when you need them. Don't overthink it upfront.

As you use AI more, you'll naturally reach for these tools. You'll make mistakes - that's when you add rules to AGENTS.md. You'll repeat yourself - that's when you turn it into a command. You'll see patterns - that's when you codify them into skills.

The real benefits come from good tests and infrastructure. Everything else builds on that foundation.
-->

---

# Quick Wins to Start

**Today:**
- Check if your repo has pre-commit hooks
- How complete are your tests?

**This Week:**
- Start an AGENTS.md with one rule when model fails
- Create one custom command for something you repeat

**This Month:**
- Update AGENTS.md during PR reviews
- Build a small toolkit of 3-5 commands

<!--
Quick wins to get started.

Today: check if your repo has pre-commit hooks. How complete are your tests? That's your foundation.

This week: start an AGENTS.md file. Add one rule when the model fails. Create one custom command for something you repeat.

This month: make updating AGENTS.md part of your PR review process. Build a small toolkit of 3-5 commands.

Don't try to do everything at once. Build gradually.
-->

---

# Self-Assessment Questions

Ask yourself:

1. How complete are your tests?
2. Do you have pre-commit hooks?
3. What conversations do you keep having with AI?
4. What cleanup steps happen before every PR?
5. Who is your team's AI champion?

<!--
Self-assessment questions to think about.

How complete are your tests? Do you have pre-commit hooks? What conversations do you keep having with AI? What cleanup steps happen before every PR? Who is your team's AI champion?

These questions help you identify where to focus your effort.
-->

---

# What's Next

**This Afternoon: Async Agents 101**

- Kicking off background agents
- Linear, Slack, and GitHub integrations
- Parallel execution patterns
- Delegation philosophy

Topics covered today are prerequisites for async workflows.

<!--
This afternoon is Async Agents 101.

We'll cover kicking off background agents, integrations with Linear, Slack, and GitHub, parallel execution patterns, and delegation philosophy.

The topics we covered today - AGENTS.md, commands, testing infrastructure - are prerequisites for async workflows. Async agents need ways to verify their work, and better agent context lets you trust them with more complex tasks.
-->

---
layout: center
---

# Questions?

<div class="mt-12">

**Resources:**
- Commands: github.com/jxnl/dots
- MCP Servers: smithery.ai
- Skills: github.com/openai/skills
- Wispr Flow: wisprflow.ai (code: JASON50)

</div>

<!--
Questions?

Resources are listed here. My dots repo has the Git commands we discussed. Smithery has MCP server integrations. OpenAI maintains a skills catalog. And Wispr Flow for voice dictation with code JASON50.
-->
