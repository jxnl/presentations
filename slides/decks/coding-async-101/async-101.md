# Async Agents 101: Background Agents & Async Workflows

## Overview

This document covers asynchronous agent workflows where you delegate tasks and let them run independently while you focus on other work. Async workflows typically run for minutes to hours without supervision.

**What makes a workflow async:**
- You kick off work and walk away
- Agent runs independently in the background
- You review results later (via PR, Slack, or dashboard)
- Multiple agents can work in parallel on different tasks

**Prerequisites:** This course assumes familiarity with synchronous agent workflows covered in Sync Agents 102. Topics like AGENTS.md configuration, custom commands, planning workflows, and code review are covered there.

---

## Why Async?

Async workflows unlock a category of work that would otherwise never happen.

**The multiplication effect:** Every codebase has a backlog of small improvements that never get prioritized - documentation updates, minor bug fixes, logging consistency, code cleanup. Humans deprioritize these because the context-switching cost is too high. By the time you load the relevant files into your head, understand the change, make it, and test it, you've lost 20 minutes on something that "wasn't worth it."

Agents eliminate that cost. They can context-switch instantly between ten different small tasks. Ten 50-line PRs compound into significant progress over a day or week, each with clear scope and low risk.

**Work continues without you:** Kick off a task from your phone before bed, wake up to a full implementation. Start an agent before your 10am standup, review the PR over lunch. Tag an issue during a meeting, merge the fix before end of day. The work happens in parallel with your life, not blocking it.

**Small wins add up:**
- Each small fix can be reviewed and merged quickly
- Builds your confidence in the agent's capabilities
- Creates momentum that compounds into larger delegations over time

The question shifts from "is this worth my time?" to "is this worth kicking off?" - and the answer is almost always yes.

---

## Where Can You Kick Off Agents?

Different platforms suit different task types. The key insight: match your kickoff method to the complexity of the task.

### Cursor: Plan Mode to Background Agent

The most structured approach. Use this for complex features where you want to iterate on the approach before committing agent time:

1. Enter Plan Mode in Cursor
2. Iterate on the plan with the agent until you're satisfied
3. Review the plan, ask clarifying questions, refine scope
4. Kick off the background agent with the detailed plan
5. Agent executes independently while you work on something else

This pattern works well when you need to think through the implementation approach, identify edge cases, or coordinate with existing code patterns before letting the agent run.

### GitHub: @-Mentions on Issues and PRs

For small, well-defined changes, mention agents directly where the work is defined:

- **On Issues:** Tag an agent in the issue comments to pick up and implement the feature or fix
- **On Pull Requests:** Mention an agent to make small adjustments, address review feedback, or fix failing tests
- Agent reads the issue/PR context and creates commits directly

This pattern works well for isolated changes where the context is already captured in the issue or PR description.

### Slack: Conversational Delegation

The most casual approach, suited for quick fixes and operational tasks:

- Tag an agent in any channel with a request
- Agent picks up the task from the conversation context
- Review results via Slack notifications and screenshots
- Works from mobile, during meetings, or while doing other work

This pattern works well for bug fixes, documentation updates, and small improvements that don't need detailed planning.

### Choosing the Right Pattern

| Pattern | Best For | Context Required | Planning Overhead |
|---------|----------|------------------|-------------------|
| Cursor Plan Mode | Complex features, architectural changes | High - iterate on plan | High - but worth it |
| GitHub Mentions | Isolated fixes, PR feedback, test fixes | Medium - issue/PR context | Low |
| Slack | Quick fixes, docs, small improvements | Low - conversational | Minimal |

The progression typically looks like: start with GitHub mentions for small fixes, move to Slack for operational tasks, and use Cursor Plan Mode when the task needs real architectural thinking.

### Building Confidence Through Better Agent Context

As you get more comfortable, start deploying things asynchronously and build confidence in the agent's ability to understand your codebase. This confidence comes from improving your AGENTS.md files over time.

Each time an agent misunderstands something about your codebase, add a clarifying rule to AGENTS.md. Over weeks and months, your agent context becomes rich enough that you can trust background agents with increasingly complex tasks. The agent's understanding of your codebase improves with every correction you make.

**The confidence progression:**
1. Start with small, well-defined tasks where failure is low-cost
2. Review agent output carefully, noting where it misunderstands patterns
3. Update AGENTS.md with corrections and clarifications
4. Gradually increase task complexity as success rate improves
5. Eventually trust agents with multi-file changes and feature work

### Testing Infrastructure as the Foundation

All of this async agent work is predicated on how well your testing infrastructure works. Without ways for agents to verify their changes, you're back to reviewing everything manually.

**Small tests have their place, but real verification is more valuable:**
- Unit tests catch obvious regressions
- API tests against real endpoints catch integration issues
- Staging deployments catch environment-specific problems
- Preview deployments let agents see what users will see

**The Full Async Loop:**

You can imagine a world where a coding agent can:
1. Fix the code based on an issue or feedback
2. Make a pull request
3. Wait for the preview deployment to complete
4. Use a web browser to inspect the preview deployment
5. Verify the fix looks correct
6. If something's wrong, iterate and try again

These things are possible. These things are happening. The agents that can spin up preview environments and visually verify their work are dramatically more reliable than agents that can only run unit tests.

**What this means for your infrastructure:**
- Invest in preview deployments (Vercel, Netlify, Railway, etc.)
- Set up CI that agents can read and respond to
- Give agents access to staging environments when safe
- The better your verification infrastructure, the more you can trust async agents

**The Security Trade-off:**

This is a double-edged sword. Giving agents access to preview deployments, staging environments, and real APIs means your coding environments need more open API access and credentials. This creates security exposure:

- Agents need credentials to deploy and verify
- More credentials in the environment means more attack surface
- Misconfigured agents could leak secrets or access production data
- Third-party agent platforms add another trust boundary

**Mitigations to consider:**
- Use scoped, read-only credentials where possible
- Separate staging credentials from production entirely
- Audit what agents can access and what they actually use
- Use ephemeral environments that spin down after verification
- Review agent platform security practices before giving access

The teams getting the most value from async agents have invested in both the infrastructure AND the security guardrails. You can't have one without the other.

### Observability Integrations

Some teams connect agents to observability platforms like Sentry or Datadog. This enables agents to:

- Inspect error logs and stack traces automatically
- Correlate errors with recent code changes
- Identify patterns across multiple error reports
- Propose fixes based on actual production behavior

When an error occurs, the agent can pull the relevant logs, understand what went wrong, and create a fix - all without you needing to manually investigate. This turns error triage from a reactive task into an automated background process.

---

## Part 1: Async Platforms & Interfaces

## Linear Integration for Async Workflows

Linear evolved into an AI-native command center for engineering workflows. Issues can be delegated to coding agents (Cursor, Cogen, Factory, Devlane) while maintaining human ownership.

**Key Capabilities:**
- Assign Linear issues directly to coding agents for automated implementation
- Agents work in background sessions while you focus on other tasks
- Each agent gets its own session with activity history, similar to IDE sessions
- Agents are first-class citizens: mentionable, assignable, with their own activity streams
- Real-time webhook subscriptions for event-driven agent triggers
- Workspace-level prompt guidance automatically fed to all agents for company-specific context

**Future PR Review Flow:**
- Pull PRs into Linear
- Provide instructions and feedback
- Iterate on fixes entirely within platform

**Two Approaches:**
1. **Linear as orchestrator:** Linear as MCP client orchestrating everything
2. **Linear as source of truth:** Organize from Cursor, pull Linear context as needed

**Team Workflow:**
- PMs add context to Linear tickets
- Engineers pull context into Cursor for execution
- Background jobs run directly from Jira/Linear while engineers work on other tasks

---

## Slack Integration for Async Delegation

Slack integration enables conversational delegation and mobile code reviews.

**Key Workflows:**
- Tag Devin in Slack channels to delegate tasks conversationally
- Receive screenshot-based code reviews on mobile
- GitHub issues flow to Slack, tag agent for implementation, review via screenshots on phone
- "Devin, please do a release" triggers automated QA review, bug assignment, team reminders

**Mobile Workflows:**
- Use Devin from mobile device while at gym to kick off multiple agents
- Review agent work via Slack screenshots on mobile without opening laptop
- Kick off tasks between meetings, during lunch, before bed

**Small Changes Workflow:**
- Bug reports, docs updates, issues often merge without manual work
- Slack integration handles the quick fixes that would otherwise pile up

### Case Study: Cognition's Release Management Command

Cognition (the company behind Devin) uses a custom command internally for release management. When someone types "Devin, please do a release" in Slack, it triggers a multi-step automated workflow:

**What the command does:**

1. **Reviews QA results** - Checks the current state of the release queue
2. **Determines bug ownership** - Uses git history to figure out who wrote the code causing issues
3. **Tags responsible engineers in Slack** - Messages the right people via MCP server integration
4. **Sends reminders** - Follows up if issues remain unaddressed

**Why this works as async delegation:**

The release process follows a predictable pattern, but involves multiple steps that take time - reviewing test results, looking up git blame, messaging people, and waiting for responses. The human kicks it off with a single Slack message and walks away. Devin handles the coordination work that would otherwise require checking multiple systems and sending manual messages.

**The MCP server pattern:**

The Slack messaging works through an MCP server that gives the agent the ability to send messages to specific channels and users. The Slack API is complex, but authentication is handled once at the server level. The agent orchestrates git lookups, QA checks, and Slack messaging together into a single workflow.

Source: Cognition guest speaker session

---

## `/make-linear-ticket` Command

When spotting an issue while coding, type the command and keep going. The command:
- Grabs current context (file, recent changes, error messages)
- Auto-routes to right project based on file path
- Includes code snippets automatically
- Tags right agents for async execution

**Example:** Working on frontend, notice backend API issue, type `/make-linear-ticket "API returning inconsistent date formats"` and keep coding. By lunch, a PR fixing it exists.

---

## Codex Multi-Interface Access

Codex operates as a single unified agent accessible through multiple interfaces, designed to function as an AI software engineer on your team.

**Available Interfaces:**
- CLI
- VS Code/Cursor/Windsurf extensions
- Browser (chatgpt.com/codex)
- GitHub mentions
- Slack integration
- iOS app
- GitHub Actions
- Codex SDK (TypeScript, Python coming) for programmatic control

**Codex-Specific Features:**
- **Auto-context:** IDE extension automatically pulls relevant files without manual specification
- **Resume command:** `/resume` picks up previous work sessions
- **Research mode:** `codex-cli --research` for enhanced context gathering
- **GPT-5 Codex:** Dynamically adjusts reasoning time based on task complexity

**Access:**
- Available through ChatGPT subscription (Plus, Pro, Business, EDU, Enterprise)
- No API key required
- Can bring your own API key for custom configurations
- Enterprise/EDU admins must enable Codex for their organization

**Example Workflows:**
- Between-meetings: spotted documentation typo via Slack, told Codex to fix it between presentations, merged and deployed minutes later
- Overnight development: kicked off task via iOS app before bed, woke up to full implementation

---

## Part 2: Parallel Execution

## Parallel Session Management (Boris's Approach)

Run multiple agent sessions simultaneously to maximize throughput.

**Setup:**
- Run 5 terminal sessions in parallel (numbered tabs 1-5)
- Run 5-10 web sessions at claude.ai/code in parallel with terminal sessions
- Use system notifications to know when agent needs input (iTerm2 config)
- Hand off sessions between terminal and web using `&` operator

**How It Works:**
- Start multiple sessions that work independently while you focus elsewhere
- Sessions continue processing while you switch between them
- Use notifications to know when to check back on a session

---

## Cloud Tasks and Background Processing

Cloud tasks run in isolated containers with common toolchains (Python, Node.js, npm, pnpm, pip) already installed.

**Key Benefits:**
- Sandboxing prevents agents from breaking out of project boundaries
- Can run multiple instances of same task with different approaches
- Cloud tasks run in isolated environments with no conflict risk
- Can run multiple tasks locally and in cloud simultaneously

**Agent-First View:**
- New view feels more like ChatGPT than traditional IDE
- Built for managing multiple agent tasks
- Can run same task 3-4 times in parallel to compare implementations and pick best one

**Computer Use Mode:**
- Embedded browser for visual debugging and design iteration
- Devin can use full Chrome browser instance with persistent state
- Handles OAuth login, two-factor authentication, cookie persistence automatically
- Can execute 20+ minute testing workflows filling out complex UI forms and monitoring results

---

## A/B Testing Implementations

Run multiple instances of the same task with different approaches.

**Workflow:**
1. Kick off 4 parallel versions of the same task
2. Review generated screenshots to compare implementations
3. Choose preferred version (e.g., version 2)
4. Request refinements: "remove boxes and horizontal lines"
5. Kick off 4 more variations from the chosen version
6. Continue parallel exploration until satisfied

**Example:** Logo scrolling feature - kicked off 4 parallel versions, reviewed screenshots, chose version 2, requested refinements, kicked off 4 more variations.

Screenshots are auto-generated for visual comparison between implementations.

---

## Repository Structure for Parallel Work

Structure your repository to enable parallel agent work without conflicts.

**Naming:**
- Use unique project codenames that don't appear elsewhere in codebase (e.g., "wam" for Codex project)
- Enables effective ripgrep usage for fast navigation

**Folder Structure:**
- Multiple example folders allow parallel work without conflicts
- Agents won't run into each other when updating different folders
- Can kick off 3 tasks to update different folders simultaneously without git conflicts

**Dependency Management:**
- Use pnpm workspace structure for separate dependencies per example
- Separate package.json files prevent dependency conflicts
- Code duplication more acceptable when AI manages overhead

**Branch Isolation:**
- Git worktrees remain valid option for branch-level isolation
- Use worktrees when working on same files with different agents

---

## Part 3: Async Workflow Patterns

## Real-Time Feedback Workflow

One powerful pattern: keep the agent UI open during meetings where people give you feedback.

**Example workflow:**
- Have Codex (or another agent UI) open while stakeholders review your website
- As people give feedback, drop each piece of feedback as a message to the agent
- Agent works on fixes in the background while the meeting continues
- By the end of the meeting, you may have PRs ready for some of their fixes

**Types of fixes that work well in this pattern:**
- Ordering of panels or sections
- Copywriting and text changes
- Small UI adjustments
- Bug fixes that were just identified
- Layout tweaks based on feedback

These are small, well-scoped changes where the feedback itself provides enough context. The agent can often produce a working PR before the meeting ends.

---

## Delegation Philosophy

The core philosophy: delegate like a tech lead. Treat agents as senior engineers who work independently, not tools requiring constant supervision.

**Key Principles:**
- Give 1-2 sentence instructions and let the agent run
- Talk to agents like senior engineers, not with overly assertive language
- Kick off tasks immediately when thought of, not when time available
- Avoid babysitting - if watching code being written, you're using it wrong
- Interrupt and steer if needed, but trust independent execution

**Competition Metric:** Engineers compete on longest uninterrupted agent runs (7+ hours recorded). Long runs indicate complex task capability, not unnecessarily extended execution.

---

## Sync vs Async Framework

Understanding when to use each approach:

| Mode | Duration | Attention | Use Case |
|------|----------|-----------|----------|
| Synchronous | 20 seconds to 1 minute | Full attention | Quick questions, small edits |
| Asynchronous | Minutes to hours | Delegated | Full features, complex tasks |
| **Danger Zone** | 5-10 minutes | Semi-attentive | Avoid this range |

**Avoid the "semi-async danger zone"** of 5-10 minute waits that break focus. Either go fast (under 20 seconds) or fully async.

**Management Skills Transfer:**
- People with management experience adopt async agents faster
- Delegation and task management are fundamentally different skills
- Management experience teaches how to delegate, context switch between tasks, and review work asynchronously

---

## Recommended Cycle: Plan, Code, Test

Structure your day around this continuous cycle:

1. **Synchronous planning:** Use fast IDE tools to understand codebase, ask questions, create task specs
2. **Asynchronous coding:** Delegate implementation to agents that work independently while you plan next task
3. **Synchronous testing:** Test and refine agent's changes using IDE tools for quick iteration
4. **Continuous cycle:** While one agent codes, you're planning next task and testing completed work

---

## Background Task Patterns

Start small and build confidence:

1. **Start with 200-line PRs** - Get comfortable with the workflow
2. **Learn how explicit you need to be** - Calibrate your instructions
3. **Recognize patterns** - As you work with agents more
4. **Scale up** - 200-line PRs become 400-line, then 800-line PRs
5. **Treat as team members** - Agents work while you're in meetings

**High-Value Patterns:**
- Have small idea? Kick it off before 10am standup
- Notice bug while reviewing code? Tag agent in Slack and let it handle fix while you grab coffee
- **Multiplication effect:** Writing code that would never be written because it wasn't worth the context switch

---

## Part 4: Team Adoption

## Team Workflow Patterns

**Internal Adoption Example (Linear team):**
- Uses Slack agent extensively
- Project-specific channels where team members drop feedback/bugs
- Agent quickly files issues from channel discussions

**Jason's PR Workflow:**
- Uses Cursor to create Linear tickets for separate concerns during PR work
- Assigns agents to those tickets
- Merges them independently
- Then merges back to main PR
- Keeps PRs focused and organized

**Future Direction:** Linear could evolve into managing agents like a manager assigns tasks to team members, with machines eventually delegating to other machines.

---

## Scaling Async Workflows

**Scaling Without Chaos:**
- Define allowed task categories (docs, linting, logging consistency, small fixes)
- Require evidence: agents attach logs/screens to tickets or PRs
- Set success metrics (time saved, PR size, rework rate)

**Building Trust:**
- Start with 1-2 background tasks per day
- Build habit first
- Build trust before delegating complex features

**Quality Improvements:**
- Background agents handle quality improvements that never make it into sprints
- Codebase gets cleaner without pulling engineers off features

---

## Key Takeaways

1. **The Multiplication Effect:** Async workflows unlock work that would never happen otherwise. Small improvements, bug fixes, and documentation updates pile up because context-switching costs make them "not worth it" for humans. Agents eliminate that cost.

2. **Where Can You Kick Off Agents:** Use Cursor Plan Mode for complex features (iterate on plan, then kick off), GitHub @-mentions for isolated fixes on issues/PRs, and Slack for quick conversational delegation. Match kickoff method to task complexity.

3. **Build Confidence Through AGENTS.md:** As you improve your AGENTS.md files over time, you can trust agents with increasingly complex async tasks. Each correction compounds into better agent understanding of your codebase.

4. **Real-Time Feedback Workflow:** Keep agent UI open during feedback meetings. Drop feedback as messages, get PRs by end of meeting. Works great for panel ordering, copywriting, small UI adjustments, and bug fixes.

5. **Observability Integrations:** Connect agents to Sentry or Datadog so they can inspect logs, correlate errors with code changes, and propose fixes automatically.

6. **Testing Infrastructure is the Foundation:** Async agents need ways to verify their work. Invest in preview deployments, CI that agents can read, and staging environments. More agent access means more credentials in the environment - invest in both infrastructure AND security guardrails.

7. **Linear and Slack Integration:** Use Linear as command center for delegating work to agents. Slack integration enables conversational delegation and mobile code reviews. Create `/make-linear-ticket` commands to capture issues without context switching.

8. **Codex Multi-Interface Access:** Same agent works across CLI, browser, mobile, IDE, Slack, and GitHub Actions. Kick off tasks from any device.

9. **Parallel Session Management:** Run multiple terminal and web sessions simultaneously. Use system notifications to know when agents need input.

10. **Cloud Tasks:** Run multiple instances of same task in isolated environments. A/B test implementations by comparing screenshots.

11. **Async Delegation:** Treat agents like senior engineers - delegate with 1-2 sentences, kick off immediately when thought of, avoid babysitting.

12. **Avoid Semi-Async:** Either go fast (under 20 seconds) or fully async. The 5-10 minute range breaks focus.

13. **Repository Structure:** Use unique project codenames, multiple example folders, and pnpm workspaces to enable parallel agent work without conflicts.

14. **Team Scaling:** Define allowed task categories, require evidence from agents, set success metrics. Build trust before delegating complex features.

---

## Cross-References

For related topics covered in Sync Agents 102:
- **AGENTS.md configuration and organization** - See Sync 102, Part 1
- **Custom commands and slash commands** - See Sync 102, Part 2
- **MCP servers** - See Sync 102, Part 2
- **Skills and toolkits** - See Sync 102, Part 2
- **Planning workflows** - See Sync 102, Part 3
- **Context loading and file management** - See Sync 102, Part 3
- **Code review workflows** - See Sync 102, Part 4
- **Visual verification** - See Sync 102, Part 4 and Part 5

---

## Get Started Now

Ready to set up your first async workflow? Start here:

- **Cursor Cloud Agents:** [cursor.com/docs/cloud-agent](https://cursor.com/docs/cloud-agent)
- **Codex:** [chatgpt.com/codex](https://chatgpt.com/codex)
- **Codex Slack Integration:** [developers.openai.com/codex/integrations/slack](https://developers.openai.com/codex/integrations/slack/)

---

## Setup Time

This session is shorter than Sync 102, giving you time to set up async agent tooling. Use this time to configure one or more of the following:

### Codex Setup (Web)

Codex is OpenAI's cloud-based coding agent. Access requires ChatGPT Plus, Pro, Business, Edu, or Enterprise plan.

**Getting Started:**

1. Go to [chatgpt.com/codex](https://chatgpt.com/codex)
2. Connect your GitHub account when prompted
3. Grant repository access to the repos you want Codex to work on
4. Add any environment secrets needed for your project (API keys, etc.)

**Starting a Task:**

1. Select a repository from your connected repos
2. Describe the task (bug fix, feature, refactor, etc.)
3. Codex creates a cloud environment, clones your repo, and starts working
4. You can close the tab and come back later - the task continues running

**Reviewing Results:**

- Codex creates a pull request when the task completes
- Review the PR on GitHub as you would any other PR
- Tag `@codex` in PR comments to request changes

**Documentation:**
- [Codex Quickstart Guide](https://developers.openai.com/codex/quickstart/)

### Cursor Cloud Agents Setup (Web/Mobile)

Cloud agents (formerly called background agents) run in isolated Ubuntu-based cloud environments and can be triggered from the IDE, web, mobile, or Slack.

**Getting Started:**

1. Go to [cursor.com/agents](https://cursor.com/agents)
2. Sign in with your Cursor account
3. Connect your GitHub (or GitLab) account
4. Grant read-write access to repositories you want agents to work on

**From the IDE:**

- Select **Cloud** in the dropdown under the agent input
- Or use `Cmd+Shift+P` and run `Cursor: Start Cloud Agent Setup` to configure your environment

**Configure Your Environment:**

The recommended way is through the UI setup flow:
1. Run `Cursor: Start Cloud Agent Setup` from the command palette
2. Follow the guided setup to configure base environment, install commands, and secrets
3. Create a snapshot of your configured environment for reuse

Or manually create `.cursor/environment.json` in your repo:

```json
{
  "snapshot": "POPULATED_FROM_SETTINGS",
  "install": "npm install",
  "terminals": [
    {
      "name": "Dev Server",
      "command": "npm run dev"
    }
  ]
}
```

**Secrets:**

Add environment variables and API keys through:
- **IDE:** Cursor Settings > Cloud Agents > Secrets
- **Web:** [cursor.com/dashboard?tab=cloud-agents](https://cursor.com/dashboard?tab=cloud-agents) > Secrets

**Documentation:**
- [Cursor Cloud Agents](https://cursor.com/docs/cloud-agent)
- [Cursor Web & Mobile](https://docs.cursor.com/background-agent/web-and-mobile)

### Slack Integration

**Codex + Slack:**

1. Set up cloud tasks first (requires Plus, Pro, Business, Enterprise, or Edu plan)
2. Go to [Codex settings](https://chatgpt.com/codex) and install the Slack app for your workspace
3. Add `@Codex` to a channel
4. Mention `@Codex` with your prompt - it can reference earlier messages in the thread
5. Codex creates a cloud task and replies with results

Documentation: [Codex Slack Integration](https://developers.openai.com/codex/integrations/slack/)

**Cursor + Slack:**

1. Set up Slack integration through [Cursor Web & Mobile settings](https://docs.cursor.com/background-agent/web-and-mobile)
2. Mention `@Cursor` in any Slack channel to trigger a cloud agent
3. Receive Slack notifications when agents complete tasks
4. Review agent work via screenshots sent to Slack (great for mobile)

### Code Review Bots

**Codex GitHub Integration:**
- Tag `@codex` in GitHub PR comments to request changes or reviews
- Works on any PR in connected repositories

**Cursor Code Review:**
- `/review` command for local code review before pushing
- "Find Issues" feature in the IDE for identifying problems
