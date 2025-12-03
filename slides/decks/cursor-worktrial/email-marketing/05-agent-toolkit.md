# Email 5: Give Your AI Agent a Toolkit (30-minute exercise)

**Subject:** The CLI scripts you'd never write yourself (but AI will use daily)

**By the end of this email, you'll be able to:**
- Build simple CLI tools that AI agents can use to test their own work
- Create utilities you'd never prioritize but that multiply productivity

Hi Jason here,

Your team can now plan, your AGENTS.md files guide code style, and your custom commands automate PR workflows. Now let's talk about the force multiplier: **giving your AI agent its own toolkit**.

## The Shift in Thinking

AI coding isn't just about writing code 20% faster. It's about **creating code you'd never give yourself time to write**.

Think about those "nice to have" scripts you've thought about but never prioritized. You'd never spend 2 hours building a test data seeder or API validator. AI can build them in 15 minutes while you're in a meeting, then use them to improve its own work.

> **For IC implementers:** Focus on tools that let AI verify its own work. A simple seed script or API validator means you review working code instead of debugging failures.
> 
> **For team leads:** Encourage your team to build these utilities during slack time. They become team assets that make everyone faster.

## Real Examples

### Database Seeding CLI (Coding)
**The problem:** Testing features required manually creating data through the UI.

**The solution:** I told AI to create a CLI that seeds realistic test data. Now when AI is working on a feature, I tell it: "Use the seed CLI to create test data, then run the tests."

**Result:** AI can test its own code without me clicking through forms.

### QR Code + Short Link Generator (Non-coding)
**The use case:** I write blog posts with lots of links and want to track clicks.

**The CLI I built:**
```bash
./shorten-url.py https://example.com/long-url
# Outputs: short.link/abc123 + qr-codes/abc123.png
```

**The workflow:** Now when I'm writing, I tell AI: "Convert all URLs in this post to short links and generate QR codes." What used to take 20 minutes happens automatically.

## The Pattern: Build Tools AI Can Use

**Three characteristics:**
1. Simple interface (AI can figure it out from `--help`)
2. Idempotent (safe to run multiple times)
3. Useful for testing (AI can verify its own work)

**Examples:** `./seed-data.py --scenario login-flow`, `./run-isolated-test.sh test_name`, `./check-api.py endpoint`

**Keep it simple:** A 20-line Python script with Typer, a Makefile target, or even a bash script works perfectly. Save complex frameworks for when you actually need them.

### Ownership & Discoverability (Team Tip)

- Place CLIs in `tools/` (or `scripts/`) with clear names
- Include `--help` and example usage
- Avoid duplicates; bless one canonical tool per use case

## This Email's Action Item

**30-minute exercise:** Build one CLI tool AI can use to test its work.

**Pick one:**
- `./seed-data.py --scenario basic-users` - creates test users
- `./test-api.py endpoint` - validates API responses  
- `./run-isolated-test.sh` - spins up fresh database, runs tests

**Success metric:** Next time AI works on a feature, it uses your CLI to verify the code works without you asking.

Next email: MCP servers - when CLI tools aren't enough.

Best,
Jason

P.S. - Reply with your CLI tool and I'll review it personally. And if you want to see CLI tool building done live with guest speakers from AI companies, email readers get 30% off our 3-day cohort with a hackathon where you build tools for your codebase: [Join the cohort →](https://maven.com/nila/ai-coding-accelerator?promoCode=EMAIL)