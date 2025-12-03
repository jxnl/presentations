# Email 4: Custom Commands That Run Your PR Workflow (20-minute setup)

**Subject:** Steal my AI /commands that I use every day

**By the end of this email, you'll be able to:**
- Turn repeated AI instructions into reusable slash commands
- Automate PR cleanup and commit organization in under 20 minutes

Hi Jason here,

Your AGENTS.md is working. Now let's talk about **custom slash commands** - the productivity multiplier that automates your entire PR workflow.

It was 3pm on a Tuesday. I had just finished a feature and was staring at my git diff - 47 files changed, commits all over the place, random console.log statements scattered throughout. The kind of mess that happens when you're in flow state and AI is "helping."

I was about to spend 30 minutes cleaning everything up manually (again) when I realized something: I keep having the same conversation with AI over and over.

"Clean up these redundant comments."
"Group these commits logically."  
"Fix the CI failures."

So I built three commands that changed everything.

> **For IC implementers:** Custom commands save you 20-30 minutes per PR on cleanup. Start with one command for your most common cleanup task.
> 
> **For team leads:** Share team commands in your repo's `.claude/commands/` or `.cursor/commands/` folder. This standardizes PR quality without adding review overhead.

## The Three Commands

**`/de-slop`** - Removes AI artifacts (redundant comments, temp files, mock-heavy tests)

**`/gh-commit`** - Groups changes into logical commits automatically (`feat` → `test` → `docs` → `refactor` → `chore`)

**`/gh-fix-ci`** - Downloads CI logs and fixes failures automatically (Ruff, tests, type errors)

Here's what actually happened: I went from spending 30 minutes per PR on cleanup to spending 2 minutes reviewing what AI already cleaned up.

## The Real Magic Isn't the Commands

The magic is that these aren't just shortcuts. They're **codified experience**.

Every time I found myself giving AI the same instructions, I turned it into a command. After three months, I had a toolkit that handled 90% of the repetitive cleanup that was eating my time.

**`/de-slop` came from** me repeatedly asking AI to "remove all the print statements and redundant comments from this code."

**`/gh-commit` came from** me explaining for the 100th time how to group changes into logical commits that make sense to human reviewers.

**`/gh-fix-ci` came from** me copying CI error logs into chat and asking AI to fix them.

## Commands You Can Steal Today

I've already built these at [github.com/jxnl/dots](https://github.com/jxnl/dots/tree/master/claude): `/gh-commit`, `/gh-review-pr`, `/gh-fix-ci`, `/de-slop`, `/gh-address-pr-comments`

Copy them to `.claude/commands/` or `.cursor/commands/` and they work immediately.

### Team Centralization

- Store shared commands in `.cursor/commands/` or `.claude/commands/`
- Add a `COMMANDS.md` index with: name, one-line purpose, example usage, and scope
- Use simple, descriptive names; avoid duplicates

But here's the thing - **start with just one**. Pick the cleanup task you do most often and turn it into a command. You'll be shocked how much mental energy you get back.

## This Email's Action Item

**20-minute setup:**
1. Clone commands from [github.com/jxnl/dots](https://github.com/jxnl/dots/tree/master/claude)
2. Copy to `.claude/commands/`
3. Try `/de-slop` on your current branch
4. Try `/gh-commit` to see smart grouping

**Success metric:** Your next PR has clean commits and zero AI artifacts, and you didn't spend any time on cleanup.

The goal isn't to have 47 commands. The goal is to never have the same conversation with AI twice.

Next email: How to delegate complex tasks without babysitting.

Best,
Jason

P.S. - Reply with which command saved you the most time. I collect these stories.
 
---

Small win from a real team: after adding `/gh-commit`, reviewers reported a 30% faster review time because commit diffs mapped cleanly to discussion.