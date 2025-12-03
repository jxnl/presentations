# Email 7: Increasing Scope and Asynchronous Agents

**Subject:** From 200-line PRs to background agents (your confidence curve)

**By the end of this email, you'll be able to:**
- Scale from supervised 200-line PRs to autonomous background tasks
- Delegate work that would never get done because it's "not worth the context switch"

Hi Jason here,

The journey from simple fixes to complex refactors isn't about jumping straight to 5000-line pull requests. It's about building trust—both in your agent's capabilities and your own skills as an operator.

## Start Small, Think Big

When you're first starting with AI agents, the temptation is to go big immediately. But here's what actually works: start with 200-line pull requests. Get comfortable. Learn how explicit you need to be. Understand when to switch to plan mode versus when to give direct instructions.

The AGENTS.md file might feel underdeveloped at first. That's normal. Your prompts might feel too verbose or not detailed enough. This is the learning phase, and it's essential.

## The Confidence Curve

As you work with agents more, something interesting happens. You start recognizing patterns in how they navigate your codebase. You learn which types of changes they handle well, and where they need more guidance. Your 200-line PRs become 400-line PRs, then 800-line PRs.

But here's the key insight: this growth isn't just about the agent getting better. It's about you getting better at working *with* the agent.

> **For IC implementers:** Start with small background tasks (documentation updates, logging standardization). Build trust before delegating complex features.
> 
> **For team leads:** Background agents handle the quality improvements that never make it into sprints. Your codebase gets cleaner without pulling engineers off features.

## The Asynchronous Revolution

This is where asynchronous agents change everything. Once you've built that confidence, you can start treating agents like actual team members who work while you're in meetings.

Have a small idea you want to test? Kick it off before your 10am standup. Notice a bug while reviewing code? Tag an agent in Slack and let it handle the fix while you grab coffee.

### Scaling Without Chaos (Team Tip)

- Define allowed task categories (docs, linting, logging consistency, small fixes)
- Require evidence: agents attach logs/screens to tickets or PRs
- Set success metrics (time saved, PR size, rework rate)

## Real-World Productivity

The major platforms are all moving in this direction:

- **Cursor** has compelling background agents
- **GitHub Copilot** works while you focus on other tasks  
- **Claude Code** just added background processing
- **Custom Slack integrations** let you mention agents like team members

The reality of working in a company is that not every PR needs to be a massive feature. There are countless small fixes, documentation updates, and minor tweaks that pile up because "no one has time." These are perfect for asynchronous agents.

Here's a concrete example: You can run background tasks to review your codebase for logging inconsistencies, typing issues, or documentation problems. None of these are mission-critical, but they ultimately improve your codebase quality. These are definitely not things you'd want to supervise closely—instead, you kick them off before a meeting starts, come back to review the results, and just verify things are working correctly.

Think about it: when was the last time you had "free time" to standardize logging formats across your entire codebase? Or fix all those type hints that are technically correct but inconsistent? With background agents, these quality improvements happen while you're doing other work.

## The Multiplication Effect

Here's where productivity gets interesting. When you move to asynchronous workflows, you're not just becoming 20% or 30% more efficient. You're writing code that would have *never been written* because it wasn't worth the context switch.

That typo in the README? Fixed. The outdated comment? Updated. The small performance improvement? Implemented. These aren't just efficiency gains—they're entirely new categories of work that become possible.

## This Email's Action Item

**30-minute exercise:** Pick one small task you've been putting off (updating dependencies, fixing a typo, adding a missing test). Set up your first background agent to handle it while you work on something else.

**Success metric:** The task gets completed without you actively monitoring it, and you can review the result when convenient.

Next email: How to set up custom Slack integrations so your team can mention AI agents like human colleagues.

Best,
Jason

P.S. - Start with 1-2 background tasks per day and build the habit first. You've made it through the whole email series! Our 3-day live cohort brings all of this together with live coding, guest talks from Cursor and OpenAI, and a hackathon on your own codebase. Email readers get 30% off: [Join the cohort →](https://maven.com/nila/ai-coding-accelerator?promoCode=EMAIL)
