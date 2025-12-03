# Cursor Enterprise Education Program: 90-Day Business Plan

## Executive Summary

Cursor has over 60% of the Fortune 500 as customers. Most engineers at these companies type code manually inside Cursor instead of leveraging agents, background tasks, and advanced workflows. The opportunity: a forward-deployed education program that transforms passive Cursor users into power users, measured by increased token spend across enterprise accounts.

This plan outlines a white-glove training program targeting Fortune 500 engineering teams. The program combines live instruction, hands-on implementation, and ongoing support to drive adoption of Cursor's agent-powered features.

**Primary metric:** 25% increase in token spend within trained enterprise accounts within 90 days of program completion.

---

## The Problem

### What We Observe

1. **Passive adoption:** Engineers have Cursor installed but use it like a fancy autocomplete. They never exceed their $20 spend limit.

2. **Manager mandate, no roadmap:** CTOs tell teams to "use AI more" without providing structure. Engineers experiment randomly, get burned by hallucinations, and retreat to manual coding.

3. **Skeptical senior engineers:** The highest-leverage developers dismiss AI coding because they have seen it fail. They are not watching YouTube tutorials. They need proof delivered on their terms.

4. **No internal champion:** Teams lack someone responsible for curating AGENTS.md files, setting up pre-commit hooks, and establishing AI-native workflows.

5. **Bad habits invisible to users:** When watching engineers share their screens, common anti-patterns emerge:
   - Building 4 separate features in a single Cursor thread
   - Never hitting Cmd+R to refresh context
   - Leaning into compaction without a sophisticated plan
   - Treating AI as autocomplete instead of a collaborator

### Why This Matters for Cursor

- Token spend correlates directly with value delivered
- Enterprises renewing contracts want to see measurable productivity gains
- Competition from Copilot, Claude Code, and Codex requires differentiation through developer experience and training
- Education becomes a moat: trained teams are sticky teams

---

## Strategic Context

### Relationship to Cursor Learn

Cursor Learn already covers the foundations: what models are, why models hallucinate, what context and tokens are, what tool calling is. This content was designed to remain relevant for 12+ months.

The enterprise program is the "201" level. It assumes engineers understand the basics and focuses on:
- Workflow design and habits
- Team coordination patterns
- Advanced context management
- Production-grade tooling

The two programs complement each other. Cursor Learn handles broad reach at zero cost. The enterprise program handles depth with high-touch service.

### Why Cohort-Based Training Works

The value of cohort training is primarily about time allocation, not content delivery.

**The reality:** Senior engineers whose time is worth $200+/hour will not watch 20 hours of YouTube videos. They will attend a 2-day session if their manager puts it on their calendar and tells them to skip other meetings.

**What cohorts provide that self-serve cannot:**
- Permission to stop working and learn
- Live troubleshooting when "this won't work with our legacy system"
- Peer learning from seeing other engineers' implementations
- Social proof when skeptical engineers see peers succeeding
- Immediate feedback on habits (watching people share screens)

**The insight from live sessions:** Most engineers don't realize how poorly they use AI until someone watches them. A simple observation like "you've built 4 separate features in one Cursor thread" changes behavior immediately.

### Why Cursor Should Own Education

**The case against outsourcing:**
- Brand trust matters. Education "from the horse's mouth" carries more weight than third-party courses
- Cursor controls the product roadmap. We can teach towards features that are coming
- Failed experiments (like Memories in 2.1) should be learned from internally, not communicated by external trainers
- Quality control becomes difficult with affiliate models

**What can be outsourced:** Community meetups. Cursor has ~100 ambassadors running 3 meetups per week globally. This works because:
- Lower stakes than formal education
- Community ownership creates authenticity
- Cursor has stronger community presence than OpenAI/Anthropic in this space

**What should stay internal:** Curriculum design, enterprise training delivery, and instructor certification.

---

## Education as a Product Sensor

### The Problem with Twitter-Pilled Development

AI coding discourse on Twitter skews heavily toward:
- Solo developers building greenfield projects
- Demos that work in 10 minutes but break at scale
- "Vibe coding" workflows that don't translate to teams
- Edge cases that look impressive but represent 1% of real usage

This creates a distorted picture of what users actually need. Product decisions based on Twitter feedback optimize for engagement, not enterprise adoption.

### Courses as Ground Truth

Live training sessions put instructors in front of real engineers working on real codebases. This creates a feedback loop that social media cannot replicate:

**What we observe in sessions:**
- Which features engineers discover vs. which they ignore
- Where they get stuck (the actual friction points)
- What workarounds they invent (unmet needs)
- Which mental models they bring from other tools
- What questions they ask repeatedly (documentation gaps)

**What we learn about domains:**
- How data scientists use Cursor differently than web developers
- What enterprise security constraints block adoption
- Which legacy codebases resist AI assistance
- What compliance requirements exist (healthcare, finance, government)

**Example insight:** "Follow-up questions in notebooks are generated poorly" - this comes from watching data scientists struggle, not from Twitter threads.

### The Fan-Out Model

Two deployment channels, each serving different purposes:

#### Enterprise Forward Deployment

**Structure:**
- Cursor instructors travel to Fortune 500 headquarters
- 2-3 day immersive sessions with 20-50 engineers
- Work directly on customer codebases

**Intelligence gathered:**
- Enterprise-specific pain points (compliance, security, legacy systems)
- Integration requirements (JIRA, ServiceNow, internal tools)
- Organizational friction (approval workflows, change management)
- Feature requests with business context

**Example:** Nvidia has 40,000 engineers. Most are probably writing code by hand inside Cursor. A single session reveals patterns across hardware engineers, ML researchers, and infrastructure teams - each with different needs.

#### University Ambassador Program

**Structure:**
- Computer science students trained as Cursor ambassadors
- Run workshops in their departments
- Provide feedback on student/academic use cases

**Intelligence gathered:**
- How CS education is evolving with AI tools
- What the next generation of engineers expects
- Academic research workflows (reproducibility, notebooks, collaboration)
- Fresh perspectives uncontaminated by legacy habits

**Advantages:**
- Low cost to scale (students are motivated by resume value)
- Early brand building with future hires
- Access to cutting-edge research use cases
- Pipeline for future Cursor employees

**Program design:**
- Semester-long ambassador cohorts
- Monthly training calls with Cursor team
- Stipend or Cursor Pro subscription as compensation
- Feedback form after every workshop

### The Junior Engineer Question

The enterprise program optimizes for senior engineers who already know what to build. AI accelerates their execution. But this leaves a critical question unanswered:

**What does software development education look like when AI writes most of the code?**

#### The Two Populations

| | Senior Engineers | Junior Engineers |
|---|---|---|
| **Starting point** | Decades of pattern recognition | Still building mental models |
| **AI value prop** | "Build what I already know faster" | Unclear - learning vs. delegating |
| **Risk** | Over-reliance on muscle memory | Never developing foundational skills |
| **Training need** | Workflow optimization | Fundamental rethinking |

#### Questions We Need to Answer

The university program is uniquely positioned to research these questions:

1. **What skills still matter?**
   - Debugging and reading code (AI generates, humans verify)
   - System design and architecture (AI implements, humans design)
   - Requirements gathering and problem framing
   - Code review and quality assessment

2. **What skills become less important?**
   - Syntax memorization
   - Boilerplate generation
   - Rote implementation of known patterns

3. **What new skills emerge?**
   - Prompt engineering and context management
   - AI output verification and testing
   - Multi-agent orchestration
   - Knowing when to trust vs. verify

4. **How do you learn fundamentals if AI writes the code?**
   - Does watching AI code teach you anything?
   - Should students code manually first, then learn AI tools?
   - Is there a "calculator in math class" analog here?

#### The Research Opportunity

The university program produces data that no one else has:

**Longitudinal studies:**
- Track cohorts of students using AI from freshman year
- Compare outcomes to students who learned traditionally
- Measure: debugging ability, system design skills, job placement, on-the-job performance

**Controlled experiments:**
- Same assignment, AI-assisted vs. manual groups
- Measure: time to completion, code quality, learning retention
- Answer: Does AI help or hinder learning?

**Curriculum development:**
- Partner with CS departments to redesign courses
- Create "AI-native" curriculum that assumes AI assistance
- Publish findings for broader academic community

#### Why This Matters for Cursor

1. **Thought leadership:** Cursor becomes the authority on AI-assisted education
2. **Long-term adoption:** Students trained on Cursor become professionals who use Cursor
3. **Product insight:** Understanding learning patterns informs feature design
4. **Hiring pipeline:** Identify exceptional students for internships/roles

#### Curriculum Differences: Enterprise vs. University

| Module | Enterprise Focus | University Focus |
|--------|------------------|------------------|
| Planning | Translate requirements to plans | Learn to identify requirements |
| AGENTS.md | Configure for team standards | Understand why conventions exist |
| Custom Commands | Automate repetitive workflows | Learn what workflows exist |
| CLI Tools | Build tools for testing | Learn what testing means |
| Code Review | Review AI output efficiently | Learn what good code looks like |

The university curriculum is "AI-assisted learning" not "AI-assisted productivity."

#### A Provocative Thesis

The future junior engineer might look completely different:

**Today's junior engineer:**
- Writes code slowly
- Makes many syntax errors
- Learns by doing repetitive tasks
- Graduates to senior by accumulating experience

**Tomorrow's junior engineer:**
- Generates code quickly with AI
- Focuses on verification and debugging
- Learns by reviewing and correcting AI output
- Graduates to senior by developing judgment

If this thesis is correct, the entire CS education pipeline needs redesign. Cursor can lead this conversation by generating the research that proves or disproves it.

#### Concrete University Program Initiatives

**Year 1: Observation**
- Partner with 3-5 CS departments
- Observe how students naturally use AI tools
- Document patterns, struggles, and adaptations
- Publish findings

**Year 2: Experimentation**
- Design AI-integrated curriculum modules
- Run controlled studies comparing approaches
- Measure learning outcomes
- Iterate on curriculum

**Year 3: Scaling**
- Package successful curriculum for broad adoption
- Certify universities as "Cursor-integrated programs"
- Create industry partnership for hiring graduates
- Publish comprehensive research report

### Closing the Loop

The education program feeds product development:

| Source | Signal | Product Action |
|--------|--------|----------------|
| Enterprise sessions | "Sub-agents would let us parallelize test runs" | Prioritize sub-agent feature |
| University workshops | "Jupyter cells break constantly" | Invest in notebook support |
| Both | "We need to see what the agent is doing" | Build visibility/observability features |
| Enterprise sessions | "Our security team blocks MCP servers" | Create enterprise MCP governance |

**Quarterly rhythm:**
1. Aggregate feedback from all sessions
2. Categorize by feature area and urgency
3. Present to product team with usage context
4. Track which feedback influenced roadmap

This makes the education team a strategic asset, not just a cost center. They are the ground truth about how Cursor is actually used in realistic domains.

---

## Target Market

### Primary Segments

| Segment | Size | Pain Point | Decision Maker |
|---------|------|------------|----------------|
| Fortune 500 Engineering Orgs | 500+ companies | AI mandate with no execution plan | VP Engineering, CTO |
| High-growth Startups (Series B+) | 2,000+ companies | Need velocity without headcount increase | Head of Engineering |
| Agencies/Consultancies | 500+ firms | Client pressure to adopt AI | Managing Director |

### Ideal Customer Profile

- 20-500 engineers using Cursor
- Active Cursor Enterprise contract
- Leadership has expressed AI adoption goals
- At least one engineer per team interested in championing adoption, certification they can take outside of their role?

---

## Curriculum Philosophy

### The Obsolescence Problem

Any specific feature-based content becomes outdated in 3 months. The Memories feature launched and was removed within a single release cycle. MCP server patterns evolve monthly.

**What stays relevant:**
- Mental models (context windows, token limits, hallucination patterns)
- Workflow habits (plan first, refresh often, verify before trusting)
- Team coordination patterns (AI champion role, PR standards)
- Debugging intuition (recognizing when AI is lost)

**What changes constantly:**
- Specific UI elements and keyboard shortcuts
- Feature-specific workflows (memories, compaction modes)
- Model capabilities and pricing

**The bleeding edge tension:** Engineers who want to be maximally proficient with AI will always be ahead of the tools. There is no course that captures the bleeding edge. The goal is to teach habits and mental models that remain useful as tools evolve.

### The Context Engineering Question

How much should the average engineer think about context engineering?

**The product-side answer:** Ideally, the application handles most of it. Rules files, MCP servers, automatic context stripping - these are all ways for the tool to do context engineering on behalf of the user.

**The power-user reality:** You still need to understand what is happening to get the most out of it. Features like sub-agents, background tasks, and parallel agents require understanding context flows.

**The curriculum approach:** Teach enough that engineers can diagnose problems and recognize when to reset context. Avoid deep dives into implementation details that will change.

### Git Hygiene and Code Reviewability

A recurring theme in enterprise adoption: AI-generated code needs to be reviewable by humans. This means:
- Logical commit groupings (feat → test → docs → refactor → chore)
- Clean diffs that map to discussion points
- No AI artifacts (temp files, verbose comments, mock-heavy tests)

Tools like Graphite improve this workflow. The /gh-commit command automates it. The principle: AI should produce code that looks like a thoughtful human wrote it.

---

## Curriculum Structure

The curriculum builds skills progressively, starting with habits and mindset, then moving to tooling and automation.

### Module 1: Planning Mastery (Foundation)
**Duration:** 90 minutes
**Key concepts:**
- Requirements gathering through meeting transcripts and structured notes
- Context loading: asking questions you know the answers to (fact-checking the AI)
- Collaborative plan creation (800+ line markdown plans for complex features)
- First PR is plan.md, code comes after review
- Setting expectations: complex plans result in productive code

**Context management specifics:**
- Refresh context (Cmd+R) more often than feels necessary
- Avoid leaning into compaction unless you have a sophisticated plan
- When asking questions you know the answers to, if AI gets them wrong consistently, update AGENTS.md
- Long-running sessions (40+ minutes) are acceptable only with detailed plans

**The PM-first workflow:**
One pattern that works well: PMs create the ticket description, then create the first draft PR (plan.md only). Engineers complete the implementation. This:
- Forces clear requirements before code
- Gives PMs ownership over feature specification
- Creates reviewable artifacts before engineering time is spent

**Deliverable:** Participants create a plan.md for a real feature in their codebase.

### Module 2: Repository Configuration
**Duration:** 60 minutes
**Key concepts:**
- AGENTS.md as README for agents
- Pre-commit hooks (ruff, mypy, formatting)
- Pre-push hooks for extensive test suites
- The AI champion role: who maintains these files

**Deliverable:** AGENTS.md file committed to participant's repository.

### Module 3: Custom Commands
**Duration:** 60 minutes
**Key concepts:**
- Turning repeated instructions into slash commands
- /de-slop, /gh-commit, /gh-fix-ci patterns
- Team command libraries in .cursor/commands/
- COMMANDS.md index for discoverability

**Deliverable:** One custom command built and shared with team.

### Module 4: Agent Toolkit Development
**Duration:** 90 minutes
**Key concepts:**
- CLI tools AI can invoke to test its own work
- Database seeding scripts, API validators, isolated test runners
- Three characteristics: simple interface, idempotent, useful for testing
- Building code you would never write yourself

**The "code you'd never write" insight:**
This is the paradigm shift for skeptical senior engineers. The value proposition changes from:
- "Write code 20-30% faster" (marginal improvement)
To:
- "Build the load testing script, the mock database seeder, the API validator that you've wanted for years but never prioritized"

Examples that resonate:
- "Inspect my database schema. Write a Python script that mocks a local version for tests."
- "Create a CLI that seeds realistic test data for the login flow."
- "Build a load testing script for the checkout endpoint."

This is code that would take 2+ hours manually. AI builds it in 15 minutes. The senior engineer stops thinking about AI as a typing accelerator and starts thinking about it as a capability multiplier.

**Deliverable:** One CLI tool that agents can use for self-verification.

### Module 5: MCP Integration
**Duration:** 60 minutes
**Key concepts:**
- Linear/JIRA MCP for ticket context
- /make-linear-ticket command for frictionless issue creation
- Chrome DevTools MCP for UI testing
- Auto-routing based on file paths

**Deliverable:** MCP server configured and /make-linear-ticket command working.

### Module 6: Asynchronous Workflows
**Duration:** 90 minutes
**Key concepts:**
- The confidence curve: 200-line PRs to 800-line PRs to background tasks
- Cursor background agents for non-blocking work
- Task categories: docs, linting, logging consistency, small fixes
- Evidence requirements: agents attach logs/screens to PRs

**Deliverable:** First background task completed without active supervision.

### Module 7: Team Integration
**Duration:** 60 minutes
**Key concepts:**
- AI champion responsibilities and time allocation
- Slack integrations for agent mentions
- PR workflow standardization across team
- Ongoing improvement: add to AGENTS.md when mistakes repeat

**Deliverable:** Team rollout checklist and champion designation.

---

## Delivery Models

### Tier 1: White-Glove Enterprise (Primary Focus)

**Format:** On-site or virtual, 2-3 days
**Audience:** 20-50 engineers per cohort
**Pricing:** $50K-150K depending on team size and customization
**Includes:**
- Pre-engagement codebase review
- Customized examples using customer's actual codebase
- Live coding sessions by Cursor instructors
- Hackathon on Day 3 implementing tools on real projects
- 30-day follow-up support via private Slack

**Success criteria:**
- 100% participants complete at least one deliverable
- 40% increase in token spend within 90 days
- Net Promoter Score > 50

### Tier 2: Self-Serve Curriculum (Scale)

**Format:** Video modules + exercises
**Audience:** Individual engineers, small teams
**Pricing:** Free (part of Cursor Learn)
**Includes:**
- 7 modules aligned with email series
- Interactive exercises
- Community forum for questions

**Purpose:** Lead generation for Tier 1, general brand building

### Tier 3: Train-the-Trainer (Future)

**Format:** Certification program
**Audience:** Customer Solutions Engineers, Developer Advocates at enterprises
**Pricing:** TBD
**Purpose:** Scale beyond Cursor-employed instructors

---

## Team Structure

### Phase 1: Months 1-3 (Proof of Concept)

| Role | FTE | Responsibility |
|------|-----|----------------|
| Head of Education | 1 | Curriculum ownership, instructor, customer relationships |
| Curriculum Developer | 0.5 | Content creation, exercise design |
| Field Engineering Support | 0.5 | Technical setup, codebase prep |

**Total:** 2 FTE

### Phase 2: Months 4-6 (Scale)

| Role | FTE | Responsibility |
|------|-----|----------------|
| Head of Education | 1 | Strategy, key accounts, instructor training |
| Senior Instructor | 2 | Deliver enterprise training |
| Curriculum Developer | 1 | Content updates, new modules |
| Operations Coordinator | 1 | Scheduling, logistics, NPS tracking |
| University Program Lead | 0.5 | Ambassador recruitment and coordination |

**Total:** 5.5 FTE

### Phase 3: Months 7-12 (Mature)

- 4-5 instructors covering geographic regions
- Train-the-trainer program reduces instructor load
- Curriculum team maintains evergreen content
- University ambassador network of 20-50 students across top CS programs
- Quarterly product feedback synthesis delivered to engineering leadership

---

## Success Metrics

### Leading Indicators (Track Weekly)

| Metric | Target | Notes |
|--------|--------|-------|
| Sessions delivered | 2/month in Phase 1 | Scale to 8/month by Phase 2 |
| Participants trained | 100/month in Phase 1 | Scale to 400/month |
| Deliverables completed | 80% of participants | Measures engagement |
| NPS | > 50 | Measured immediately post-session |

### Lagging Indicators (Track Monthly)

| Metric | Target | Notes |
|--------|--------|-------|
| Token spend increase | 40% within 90 days | Per trained account |
| Agent activation rate | 2x baseline | % of users invoking agents |
| Enterprise renewal rate | +10% above control | Trained vs untrained accounts |
| Referral rate | 30% | Trained accounts recommending program |

---

## 90-Day Roadmap

### Days 1-30: Foundation

**Week 1-2:**
- Finalize curriculum modules 1-4 (leverage existing email content)
- Identify first 2 enterprise pilot customers
- Create customer codebase prep checklist

**Week 3-4:**
- Deliver first pilot session (20-30 engineers)
- Collect detailed feedback
- Refine curriculum based on real classroom experience
- Document instructor playbook

### Days 31-60: Validation

**Week 5-6:**
- Deliver second pilot session with different customer
- A/B test module order and duration
- Begin measuring token spend changes in pilot accounts

**Week 7-8:**
- Finalize curriculum based on pilot feedback
- Create marketing materials: case studies, testimonials
- Build pipeline of next 10 enterprise customers
- Hire first additional instructor

### Days 61-90: Scale

**Week 9-10:**
- Deliver 4 sessions (2 per instructor)
- Begin self-serve video production for Cursor Learn
- Publish first case study with token spend metrics
- Pilot university ambassador program at 2-3 schools

**Week 11-12:**
- Deliver 4 additional sessions
- Present results to Cursor leadership (include product feedback synthesis)
- Propose Phase 2 hiring plan
- Establish quarterly curriculum review process
- Formalize product feedback pipeline with engineering team

---

## Product Feature Recommendations

The following features would meaningfully improve teaching effectiveness and agent adoption. These are based on patterns observed across Claude Code, Codex, and current Cursor limitations.

### High Priority

**1. Sub-agents**
- Allow main agent to spawn child agents for specific tasks (running tests, reviewing code)
- Child agent results summarized and returned to parent
- Prevents context pollution from verbose test logs
- Teaching impact: Enables the "agent runs tests" pattern that senior engineers find compelling

**2. Parallel Tasks**
- Kick off multiple agents simultaneously (one per service, one per test file)
- Dashboard showing task status
- Teaching impact: Demonstrates that AI coding scales beyond single-threaded workflows

**3. Repository Onboarding System (Learning Mode)**

This is the most impactful teaching feature Cursor could build. The concept: treat "agent onboarding for a repository" as a first-class unit of work.

#### The Problem Today

Engineers install Cursor, open their repo, and... nothing. They don't know:
- What AGENTS.md should contain for their stack
- Which pre-commit hooks to set up
- What CLI tools would help agents test their work
- How to configure MCP servers for their project management tool
- What custom commands would save them time

They either figure it out over months of trial and error, or they give up and use Cursor as autocomplete.

#### The Solution: Educational Subcommands

A suite of `/cursor-learn-*` or `/setup-*` commands that inspect the repository and guide setup:

| Command | What It Does |
|---------|--------------|
| `/cursor-learn-agents-md` | Scans repo, identifies patterns, generates starter AGENTS.md |
| `/cursor-learn-precommit` | Detects language/framework, suggests appropriate hooks |
| `/cursor-learn-cli-tools` | Analyzes codebase, proposes 2-3 CLI tools agents could use |
| `/cursor-learn-mcp` | Checks for Linear/JIRA/GitHub references, suggests MCP setup |
| `/cursor-learn-commands` | Reviews git history for repeated patterns, suggests custom commands |
| `/cursor-learn-testing` | Inspects test setup, suggests agent-friendly test patterns |
| `/cursor-learn-audit` | Full repo audit, produces onboarding checklist |

#### How Each Command Works

**Example: `/cursor-learn-agents-md`**

1. Scans package.json/pyproject.toml/Cargo.toml for dependencies
2. Reads existing README, CONTRIBUTING.md for conventions
3. Checks git history for common patterns (commit message style, etc.)
4. Analyzes linter configs, test setups, CI workflows
5. Generates a draft AGENTS.md with:
   - Language-specific rules (use uv not pip, prefer async, etc.)
   - Project-specific conventions detected from codebase
   - Testing requirements based on existing setup
   - Commit/PR guidelines based on git history
6. Explains each rule and why it was suggested
7. Asks for confirmation before writing

**Example: `/cursor-learn-cli-tools`**

1. Inspects database schemas → suggests seed data CLI
2. Finds API routes → suggests endpoint validator CLI
3. Detects test patterns → suggests isolated test runner
4. Analyzes deployment configs → suggests local environment setup CLI
5. For each suggestion:
   - Explains what the tool would do
   - Shows example usage
   - Offers to generate the implementation

#### The Learning Aspect

Each command teaches while it works:

```
> /cursor-learn-precommit

Analyzing your repository...

Detected: Python 3.11, FastAPI, PostgreSQL, pytest

Recommended pre-commit hooks:
1. ruff format - Auto-formats code (replaces black + isort)
2. ruff check - Lints for common issues  
3. mypy - Type checking (you have type hints in 73% of functions)

Why these matter for AI coding:
- Agents make formatting mistakes. Auto-format catches them before commit.
- Type checking prevents agents from breaking function signatures.
- Linting catches obvious bugs before you review the code.

Your CI already runs pytest. I recommend adding a pre-push hook 
for tests so agents verify their work before pushing.

Ready to set up? [Y/n]
```

#### Repository Onboarding as a Milestone

The full onboarding flow becomes a checklist:

```
> /cursor-learn-audit

Repository: acme-backend
Stack: Python 3.11, FastAPI, PostgreSQL, Redis

Onboarding Status:
[x] AGENTS.md exists (last updated 3 days ago)
[x] Pre-commit hooks configured (ruff, mypy)
[ ] No CLI tools for agent self-testing detected
[ ] No MCP servers configured (Linear integration available)
[ ] No custom commands found in .cursor/commands/
[x] Test coverage: 67% (good for agent verification)

Recommended next steps:
1. Run /cursor-learn-cli-tools to create seed data script
2. Run /cursor-learn-mcp to connect Linear
3. Run /cursor-learn-commands to create /de-slop and /gh-commit

Estimated time to complete: 45 minutes
```

#### Why This Matters for Adoption

**For individual engineers:**
- Reduces time-to-value from weeks to hours
- Teaches best practices through doing
- Creates discoverable features (most users don't know custom commands exist)

**For teams:**
- Standardizes onboarding across repositories
- Creates consistent AI-readiness across the codebase
- Reduces burden on AI champions

**For Cursor:**
- Increases engagement (users who complete onboarding use more features)
- Increases token spend (properly configured repos generate more agent usage)
- Creates teachable moments that stick

**For the education program:**
- Day 1 of training becomes: "Run /cursor-learn-audit and complete the checklist"
- Instructors focus on concepts, not setup
- Students leave with fully configured repos, not just knowledge

#### Implementation Path

**Phase 1 (MVP):**
- `/cursor-learn-agents-md` - highest impact, most requested
- `/cursor-learn-audit` - visibility into what's missing

**Phase 2:**
- `/cursor-learn-precommit`
- `/cursor-learn-cli-tools`

**Phase 3:**
- `/cursor-learn-mcp`
- `/cursor-learn-commands`
- `/cursor-learn-testing`

### Medium Priority

**4. Token Spend Dashboard**
- Per-user and per-project spend visualization
- Trend lines showing adoption over time
- Teaching impact: Gives managers visibility into who is actually using AI

**5. Plan Mode Improvements**
- First-class plan.md file creation
- Plan diffing and versioning
- Teaching impact: Reinforces plan-first workflow

**6. Jupyter Notebook Support**
- Proper cell-level editing and execution
- Data science workflows with AI assistance
- Teaching impact: Expands addressable market to data teams

---

## Competitive Positioning

| Competitor | Approach | Cursor Advantage |
|------------|----------|------------------|
| OpenAI Codex | CLI-first, async | Cursor has IDE integration, faster feedback loop |
| GitHub Copilot | Broad tutorials | Cursor can go deep on agent workflows |
| Anthropic Claude Code | Sub-agents, power features | Cursor can match features, add better UX |
| Independent trainers | Generic AI content | Cursor owns the product roadmap |

Cursor's unique position: We build the tool and know where it is going. Training from Cursor is training on the future.

---

## Risks and Mitigations

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Curriculum becomes outdated quickly | High | Medium | Quarterly review process, modular design |
| Instructors unavailable | Medium | High | Train-the-trainer program, video supplements |
| Token spend increase not measurable | Medium | High | Establish baseline measurement before training |
| Enterprises unwilling to pay | Low | High | Bundle with enterprise contracts, prove ROI in pilots |
| Competition launches similar program | Medium | Medium | First-mover advantage, product integration |

---

## Appendix: Sample Session Agenda

### Day 1: Foundations (Full Day)

| Time | Topic | Format |
|------|-------|--------|
| 9:00-9:30 | Introductions, current AI usage survey | Discussion |
| 9:30-11:00 | Module 1: Planning Mastery | Lecture + Exercise |
| 11:00-12:00 | Module 2: Repository Configuration | Live coding |
| 12:00-1:00 | Lunch | - |
| 1:00-2:30 | Module 3: Custom Commands | Hands-on workshop |
| 2:30-4:00 | Live coding demo on customer codebase | Instructor demo |
| 4:00-5:00 | Q&A, Day 1 wrap-up | Discussion |

### Day 2: Advanced Workflows (Full Day)

| Time | Topic | Format |
|------|-------|--------|
| 9:00-10:30 | Module 4: Agent Toolkit | Lecture + Exercise |
| 10:30-12:00 | Module 5: MCP Integration | Live setup |
| 12:00-1:00 | Lunch | - |
| 1:00-2:30 | Module 6: Asynchronous Workflows | Demo + Exercise |
| 2:30-4:00 | Participants implement on own codebase | Workshop |
| 4:00-5:00 | Show and tell, troubleshooting | Group sharing |

### Day 3: Hackathon (Half Day)

| Time | Topic | Format |
|------|-------|--------|
| 9:00-12:00 | Hackathon: Build one complete workflow | Teams of 2-3 |
| 12:00-1:00 | Lunch | - |
| 1:00-2:00 | Demo presentations | Each team presents |
| 2:00-3:00 | Module 7: Team Integration, rollout planning | Discussion |
| 3:00-3:30 | Wrap-up, NPS survey, next steps | Closing |

---

## Conclusion

The opportunity is clear: Cursor's enterprise customers want to adopt AI-powered development but lack the structure and expertise to do it well. A forward-deployed education program fills this gap while driving the metric that matters most: token spend.

The first 90 days focus on proving the model with 2-4 pilot customers, measuring results, and building a repeatable playbook. Success in this phase justifies the team expansion needed to reach hundreds of enterprises per year.

The curriculum already exists in draft form. The demand is there. The next step is execution.
