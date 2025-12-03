# Email 6: MCP Servers That Change How You Work (20-minute setup)

**Subject:** Three MCP servers I use daily (20-minute setup)

**By the end of this email, you'll be able to:**
- Connect AI agents to external tools like Linear or JIRA
- Create tickets without context switching, keeping you in flow

Hi Jason here,

Remember the last time you were deep in code and thought "I should really create a ticket for this bug I just found"? But then you didn't, because switching to Linear, writing the description, adding context... it just wasn't worth the 5-minute interruption.

That's exactly where MCP servers come in.

## The Copy-Paste Problem

Here's what used to happen to me every single day:

I'm coding along, spot an issue, and think "I'll remember to fix this later." Three days later, I can't even remember what file it was in. Or worse, I do switch to Linear, spend 5 minutes creating a ticket, and by the time I'm back, I've completely lost my train of thought.

But the real productivity killer? I'd spot a bug and think "it's just a quick fix" - then suddenly my focused PR for "add user authentication" becomes a mess that also fixes CSS alignment, updates error messages, refactors the API client, and changes three unrelated files. My clean, reviewable PR becomes a nightmare that takes 30 minutes to explain.

Sound familiar?

> **For IC implementers:** MCP servers eliminate context switching. Create tickets while staying in your editor, and let agents pick them up asynchronously.
> 
> **For team leads:** Start with Linear or JIRA MCP. Your team will capture more bugs and tech debt because creating tickets becomes frictionless.

## The MCP Server That Actually Changed My Workflow

I tried a bunch of MCP servers. Most were meh. One made a daily difference:

**Linear MCP** — Instead of copy-pasting ticket details, AI just... reads them. "Implement LL-123" and it pulls the full context automatically. Setup takes ~2 minutes: [linear.app/docs/mcp](https://linear.app/docs/mcp)

> Optional (advanced): **Chrome DevTools MCP** lets AI drive a browser and capture evidence while testing UI changes: [github.com/ChromeDevTools/chrome-devtools-mcp](https://github.com/ChromeDevTools/chrome-devtools-mcp)

## The Real Game-Changer: `/make-linear-ticket`

But here's where it gets interesting. The biggest win wasn't using existing tickets - it was creating new ones without context switching.

I built a custom `/make-linear-ticket` command. Now when I spot an issue while coding, I just type the command and keep going.

**Here's what it does:**
- Grabs my current context (what file I'm in, recent changes, error messages)
- Auto-routes to the right project based on file path
- Includes code snippets automatically
- Tags the right agents for async execution

**The magic moment:** I was working on a frontend feature, noticed a backend API was returning weird data, typed `/make-linear-ticket "API returning inconsistent date formats"` and kept coding. By the time I got back from lunch, there was a PR fixing it.

**Even better with browser integration:** The Chrome DevTools MCP makes this workflow insane. Here's what actually happens now:

1. I'm coding a React component
2. Notice it's rendering weird in the browser
3. Type `/make-linear-ticket "Login button has wrong hover state in Chrome"`
4. The ticket gets created with screenshots, console logs, and the exact DOM state
5. An agent picks it up, fixes the CSS, tests it in Chrome via DevTools MCP, and creates a PR
6. I review the PR with before/after screenshots attached

The browser integration means agents don't just fix code - they actually test it in a real browser environment and include visual proof that it works.

## Building Your Own (30 minutes)

This isn't as complicated as it sounds. Here's exactly what I told my agent:

"Create a `/make-linear-ticket` command that uses Linear MCP. When I run it, capture my current coding context, auto-route based on file paths (/frontend/ → Frontend project, /backend/ → Backend), and tag it for async execution."

That's it. 30 minutes later, I had something I use 5+ times per day.

## The Before/After Reality

**Before MCP:**
1. Notice bug while coding
2. Think "I'll remember this"
3. Forget completely
4. Find same bug 3 weeks later

**After MCP:**
1. Notice bug while coding
2. Type `/make-linear-ticket` with quick description
3. Keep coding
4. Agent fixes it while I'm in my next meeting

**The math:** I probably create 3-4 tickets per day this way. That's 15-20 minutes of context switching I don't do. More importantly, bugs actually get fixed instead of living in my mental backlog forever.

### Team Governance

- Standardize on one `/make-linear-ticket` command per repo
- Use shared templates and auto-routing (frontend/backend paths → correct project)
- Include code snippets and context automatically; agents attach evidence when available

## This Week's Challenge

**20-minute setup:** Pick ONE MCP server that matches your actual workflow. Don't overthink it - if you use Linear, do Linear. If you use JIRA, find a JIRA MCP. If you live in Chrome DevTools, do that.

**Then build one custom command.** Just one. Make it something you'll actually use when you're coding and spot an issue.

**Success metric:** Next time you're coding and think "I should fix this later," you actually create a ticket instead of just thinking about it.

Next email: How to move from individual commands to full asynchronous workflows.

Best,
Jason

P.S. - The `/make-linear-ticket` command I built is just 20 lines of code. The hard part wasn't the coding—it was realizing I could build it in the first place.