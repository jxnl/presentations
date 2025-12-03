# Email 2: Planning Mastery (The 80% of AI Success)

**Subject:** The 80% of AI coding that happens before you write code

**By the end of this email, you'll be able to:**
- Load context effectively so AI understands your codebase
- Create collaborative plans that prevent wasted work

Hi Jason here,

In the last email, you identified your AI champion. In this email, let's talk about the skill that separates successful AI implementations from expensive toys: **planning**.

## The Reality Check

Most engineers jump straight to "build me X" and wonder why AI gives them garbage. The secret? **80% of successful AI coding happens in planning and context loading**.

When you skip planning, you spend hours fixing integration issues, rewriting code that doesn't match your patterns, and explaining things to AI that it should have learned from your codebase. But when you plan first, AI gets it right the first time.

> **For IC implementers:** Planning prevents rework and catches integration issues before you ship. Use context loading to verify AI understands your system before asking for changes.
> 
> **For team leads:** Require a plan.md PR before code changes. This prevents the "wait, that's not how it works" conversation after weeks of work.

## Your Two-Step Planning Process

### Step 1: Load Context Like a Pro
Before asking AI to build anything, make it prove it understands your system:

**Instead of:** "Add rate limiting to the API"

**Try this sequence:**
1. "Explain how rate limiting works for logged-in vs logged-out users"
2. "Walk me through our Redis cache setup"  
3. "What libraries are we currently using for rate limiting?"

This does two things:
- Verifies the AI actually understands your codebase
- Loads relevant context into its memory before you ask for changes

### Step 2: Collaborative Planning
Once context is loaded, create a living plan:

**In Cursor:** Use plan mode (Ctrl+P then type "plan")
**In Claude Code:** Use /plan command
**Everywhere else:** Create a simple plan.md file

**Pro tip:** Make your first PR just the plan.md file. Get feedback from another engineer before any code gets written. This prevents the "wait, that's not how it works" conversation after weeks of work.

## Tools That Make This Easy

**For team discussions:** Use [Granola](https://www.granola.ai/) to record your planning meetings, then feed the transcript to ChatGPT to generate your first plan.md draft.

**For solo planning:** Use [Wispr Flow](https://wisprflow.ai/r?JASON50) to dictate your thoughts while exploring the codebase. Talking through your understanding is 3x faster than typing and gives much richer context.

## This Email's Action Item

**30-minute exercise:** Pick one feature you've been meaning to build. Spend 15 minutes asking AI to explain the existing system, then 15 minutes collaboratively creating a plan.md file.

**Success metric:** You should have a plan.md file that another engineer could review and give feedback on without seeing any code.

Next email: The 15-minute setup that makes your repository AI-friendly (so agents can fix their own mistakes).

Best,
Jason

P.S. - Reply with your plan.md file if you want feedback. I review every one personally.

---

## Team Coordination Note

For teams, standardize on a plan-first workflow:
- Call Notes / Research can produce a Plan for larger features
- First PR is `plan.md` only; code comes after review
- Leaders review plans for integration risks and alignment
- Keep plans short, specific, and testable
