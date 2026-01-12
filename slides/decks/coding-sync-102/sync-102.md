# Sync Agents 102: Commands, Skills & Tools

## Overview

**Agents 102 focuses on turning behaviors into commands, skills, and explaining what they do.**

This course takes the patterns from Agents 101 and codifies them into reusable commands and skills that make your workflow repeatable and scalable. We'll cover:

1. **Foundation:** AGENTS.md configuration and infrastructure setup
2. **Codification:** Custom commands, skills, and toolkits
3. **Workflows:** Planning, context loading, and execution patterns
4. **Quality:** Testing, verification, and code review

### A Note on AI Champions

This is going to be a lot of information. This is why I think it's really valuable for your team to define the role of an AI champion. If that role doesn't exist, your leadership really should try to figure out who from this class or on your team should be that person.

If you are in this class, really push your leadership to be that person for the company. Help set up these repos, because ultimately these are repo-level things that someone should be taking ownership of. Obviously, as the entire team gets more skills, we should allow everyone to contribute these kinds of things. But we need an individual on the team that has a mandate to really try to make these quality-of-life improvements in the repository.

Some of the setup and configuration covered in this course requires their involvement, particularly for creating and managing custom commands that standardize workflows across your team.

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

### What Enables Self-Healing?

- **Linting:** ESLint, Ruff, Prettier catch errors and style issues
- **Type systems:** TypeScript, mypy catch type errors
- **Formatters:** Consistent code style agents can follow
- **Tests:** Verify behavior matches expectations
- **Pre-commit hooks:** Block commits until checks pass

All the things engineers have complained about are now essential for agent self-healing.

### Understanding Git Hooks

**Two checkpoints for catching issues:**

| Hook | When | What to Run |
|------|------|-------------|
| **Pre-commit** | Before each commit | Fast checks: formatting, linting |
| **Pre-push** | Before pushing | Slower checks: type checking, fast tests |

Agents can't push unless all checks pass. Humans can bypass with `--no-verify`.

**Tip:** Not sure how to get started? Ask your coding agent: "Audit what pre-commit setup can be done and install it for me" - it will set everything up.

### Fast CI is Essential

Code is cheap now. Slow feedback loops kill velocity.

**Split your tests:**

| Test Type | Duration | When to Run |
|-----------|----------|-------------|
| **Fast** | < 2 min | Every push (pre-push hook) |
| **Slow** | > 2 min | PR creation, nightly, or manually |

**Rule:** Pre-push hooks run fast tests only. Save slow tests for CI.

**Tip:** Ask your agent: "Audit our tests and mark them as fast or slow, then set up pre-commit to run fast tests and CI to run slow tests"

*If your test suite takes 40 minutes, that's a separate problem to solve.*

### Start Here: Audit Your Setup

Run these prompts one at a time. Copy-paste into Cursor:

1. **Pre-commit hooks:**
   ```
   Check if we have pre-commit hooks. If not, set up pre-commit with ruff format and ruff check.
   ```

2. **Testing infrastructure/preferences:**
   ```
   Audit our testing infrastructure. What percentage of our codebase has test coverage? Which areas are untested? What testing frameworks do we use? What are our conventions for test structure and naming?
   ```

3. **Test speed:**
   ```
   Look at our CI pipeline. How long does it take? Which tests are slowest? How could we split fast vs slow tests?
   ```

4. **AGENTS.md:**
   ```
   Review our AGENTS.md file. What's missing? What patterns do we follow that aren't documented?
   ```

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

**Prompt:** "Create a new Cursor command for the process we just went through, call it /changelog"

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

Skills use progressive disclosure to manage context efficiently. At startup, only the name and description of each skill are loaded. The full skill activates when you invoke it or when the agent determines it's relevant.

**Benefits:**

- **Task-specific capabilities:** Extend Codex with domain-specific workflows
- **Shareable:** Share skills across teams or with the community
- **Structured:** More organized than simple commands with clear metadata and resources
- **Efficient:** Progressive disclosure keeps context manageable

**Skill Examples:**

Skills package your preferences, not just tool knowledge:

- **Slidev slide generation:** Create presentation slides using Slidev with your preferred layouts, components, and styling conventions
- **Deploy system:** Standardize deployment workflows, environment configs, and rollback procedures
- **Systems access:** Access systems via SOPs and MCP servers - tools to get A/B testing results, run analytics queries, or interact with internal APIs

The agent might know these tools, but skills capture how YOU want to use them.

Skills can also power verification workflows. For example, an eval runner skill can let agents test their own prompt changes against a local evaluation suite, read the results, and iterate. We'll cover this pattern in Part 4 (Quality & Verification).

### Create New Command and Create New Skill

The `jxnl/dots` repo includes commands to scaffold new commands and skills:

- `/new-cmd` - Create a new command with proper structure
- `/new-skill` - Create a new skill with SKILL.md template and folder structure

Use these to quickly bootstrap your own commands and skills.

### Toolkit Philosophy

AI coding is about creating code you'd never give yourself time to write. Those "nice to have" scripts you've thought about but never prioritized? AI can build them in 15 minutes while you're in a meeting.

**Test Data Generation:**

Instead of manually writing INSERT statements or basic fixtures, agents can analyze your database schema, understand relationships and constraints, and generate realistic test data. Thorsten needed test data for a thread starring feature - he told the agent to "use psql, look at the database, see how threads work, and make some test threads." The agent examined the schema, created valid test data, fixed its own mistakes when it hit type errors, and delivered usable results.

**Throwaway Development Utilities:**

Agent-generated code is cheap, making throwaway tools cost-effective. Tim Devereaux had an agent create UI state toggles to quickly switch between component variations while designing - invaluable for rapid iteration, then easily removed before shipping. These are the debug panels, feature flag toggles, and configuration editors you always wanted but never prioritized.

---

## MCP Servers for Synchronous Workflows

### The Practical Reality

MCP servers connect AI agents to external tools. The promise: eliminate context switching by letting agents read from Linear, Notion, Figma, etc. The reality: for most workflows, copy-pasting into Cursor works fine.

**What I've actually used:**

- **Notion** - Read and write to Notion pages
- **Linear** - Create tickets, read issues (the must-have for ticketing)

**Built-in MCP servers:**

- Browsers (Claude Code, Cursor) - Built-in browser control
- Figma - Available but haven't used much

**For everything else:** Build a CLI version and move it into a skill.

For finding more: smithery.ai has 3,400+ integrations.

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

**Talking is 3x faster than typing and gives richer context.**

Instead of typing terse prompts, just talk through your thinking in detail while exploring the codebase.

Use Wispr Flow: wisprflow.ai/r?JASON50 (free month for you, and me)

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

**Pro tip:** Create two side-by-side directories:

```text
repo/
  modular/              # Services in subdirectories (easier for AI)
    services/
      auth/
        service.ts
        types.ts
      payment/
        service.ts
        types.ts
  
  non-modular/          # Different organization
    auth-service.ts
    payment-service.ts
    auth-types.ts
    payment-types.ts
```

Code duplication is more acceptable when AI manages the overhead.

---

## Sub-Agents

**Sub-agents are useful when you want to contain how much context you burn.**

Use sub-agents for tasks that would bloat your main agent's context:

- Log data analysis: identify slow functions, report findings
- Complex UI debugging: process verbose debug output
- Metrics analysis: process logs to identify bottlenecks
- Verbose test logs: extract failures and errors from noisy test output
- Codebase research: explore codebase to find answers or source of something

Sub-agent runs separately, summarizes findings, then hands concise results back to main agent.

---

## Part 4: Quality & Verification

## Making Work Testable

**Giving agents tools to verify their work dramatically improves output.**

Tests don't have to mean unit tests - any verification mechanism works:

- Linters and type checkers
- Snapshot tests
- Integration tests
- Visual verification (screenshots)

**Pro tip:** Sometimes you can just describe tests and agents can use curl, browser, or run code to verify - then codify it into tests later.

Verification tools enable self-correction during execution.

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

## Browser Control

**Cursor's browser control enables visual debugging:**

- Embedded browser for visual debugging and design iteration
- Screenshot capture to verify UI changes
- DOM interaction - click buttons, fill forms
- Console access for reading logs and errors
- Visual verification - compare before/after screenshots

**Workflow:** Code changes, agent opens browser, takes screenshot, verifies fix matches requirements.

---

## Key Takeaways

### The Core Message

**These capabilities exist for when you need them.**

Don't overthink it upfront. As you use AI more:

- You'll make mistakes - add rules to AGENTS.md
- You'll repeat yourself - turn it into a command
- You'll see patterns - codify them into skills

**The real benefits come from good tests and infrastructure.**

Everything else builds on that foundation.

### Quick Wins to Start

**Today:**
- Check if your repo has pre-commit hooks
- How complete are your tests?

**This Week:**
- Start an AGENTS.md with one rule when model fails
- Create one custom command for something you repeat

**This Month:**
- Update AGENTS.md during PR reviews
- Build a small toolkit of 3-5 commands

### Self-Assessment Questions

Ask yourself:

1. How complete are your tests?
2. Do you have pre-commit hooks?
3. What conversations do you keep having with AI?
4. What cleanup steps happen before every PR?
5. Who is your team's AI champion?

### What's Next

**This Afternoon: Async Agents 101**

- Kicking off background agents
- Linear, Slack, and GitHub integrations
- Parallel execution patterns
- Delegation philosophy

Topics covered today are prerequisites for async workflows.

---
