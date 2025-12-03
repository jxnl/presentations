# Email 3: The 15-Minute Setup That Changed Everything

**Subject:** The 15-minute setup that prevents AI mistakes

**By the end of this email, you'll be able to:**
- Create an AGENTS.md file that prevents recurring AI mistakes
- Set up infrastructure that catches errors before they reach production

Hi Jason here,

I used to spend more time fixing AI mistakes than writing code myself. Then I discovered something that changed everything: it's not about making AI smarter—it's about making the system smarter.

1. **AGENTS.md** - Rules agents follow automatically
2. **Infrastructure** - Pre-commit hooks, linters, type checkers

Think of AGENTS.md as a README for agents. It tells AI coding agents exactly how to work on your project, but more importantly, it prevents the obvious mistakes that waste everyone's time.

## My Real AGENTS.md File (Copy This)

Here's my actual AGENTS.md that I use in every project:

```
# Use uv run, never python
# Prefer async over sync patterns  
# Write at 9th grade level in documentation
# Avoid heavily mocking tests without user permission
# Update docs when code changes
# Never git add ., specify files
# Run linters/formatters before committing
# Type check before merging
# Run affected tests for changed files
```

That's it. Nine lines that prevent 90% of the mistakes I was seeing over and over.

> **For IC implementers:** Start with these 9 rules and add to your AGENTS.md only when AI makes the same mistake twice. The infrastructure setup catches issues before you see them.
> 
> **For team leads:** Roll out AGENTS.md as a team standard. Pre-commit hooks enforce consistency without needing policy docs or code review comments.

**The "never git add ." rule** came after AI committed a 2GB log file to the repository.

**The "avoid heavily mocking tests" rule** came after AI created 200-line test files with 15 levels of nested mocks that broke every time we refactored anything.

**The "run affected tests" rule** came after AI would run the entire 15-minute test suite for a one-line documentation change.

## The Infrastructure Setup That Changed Everything

Here's the 15-minute setup that made AI useful instead of dangerous:

**Tell AI:** "Set up pre-commit hooks with ruff format, ruff check, and mypy."

That's it. The AI will configure everything - the .pre-commit-config.yaml, the pyproject.toml settings, even the GitHub Actions workflow.

**What you get:** Auto-formatting with your linter, type checking, tests that only run for changed files.

**What this prevents:** Those Friday afternoon disasters where obvious mistakes make it to production.

## Team Rollout Checklist

- Single `AGENTS.md` in the repo root (one source of truth)
- Pre-commit + CI enforce rules automatically
- Only add new rules when the same mistake happens twice
- Teach agents to read `AGENTS.md` before making changes

## The Real Impact

Before this setup, I was spending more time fixing AI mistakes than writing code myself. After the setup, AI was fixing its own issues before I ever saw them.

The difference wasn't that AI got smarter. The difference was that **the system got smarter** about preventing the obvious mistakes.

## This Email's Action Item

**15-minute setup:**
1. Create AGENTS.md with the template above (seriously, just copy mine)
2. Tell AI: "Set up pre-commit hooks"
3. Test by asking AI to make a small change and verify it follows your AGENTS.md rules

**Success metric:** AI-generated code follows your patterns without prompting, and you stop seeing the same obvious mistakes over and over.

Start with 9 lines in AGENTS.md. Add more only when AI makes the same mistake twice.

Next email: Custom slash commands that automate PR workflows.

Best,
Jason

P.S. - Reply with your AGENTS.md file and I'll review it personally within 24 hours. Also, if you want to see this in action with live coding and guest speakers from leading AI companies, email readers get 30% off our 3-day cohort: [Learn more →](https://maven.com/nila/ai-coding-accelerator?promoCode=EMAIL)