# Cursor Enterprise Education: Work Trial Deliverable

**Date:** November 28, 2024  
**Prepared for:** Lee (Cursor)  
**Prepared by:** Jason Liu  
**Timeline:** 90-day execution plan

---

## Executive Summary

This document outlines a 90-day plan to launch Cursor's enterprise education program. The goal: increase token spend across Fortune 500 accounts by transforming Cursor users (who type code manually) into users who leverage agents, background tasks, and workflows.

**Success Metric:** 40% increase in token spend within trained enterprise accounts within 90 days of program completion.

**The Opportunity:** Over 60% of Fortune 500 companies use Cursor, but most engineers never exceed their $20 spend limit. They have Cursor installed but use it like autocomplete. CTOs mandate "use AI more" but provide no structure. This program fills that gap.

---

## Core Themes

Before diving into specifics, here are the themes that recur throughout this document. These represent the foundational ideas that shape the entire program design.

### 1. Token Spend as the North Star
The success metric is **40% increase in token spend** within trained enterprise accounts.

- Most enterprise users never exceed their $20 limit, using Cursor like autocomplete
- Token spend correlates directly with value delivered
- Measurable, already tracked, aligns with business goals

### 2. Cohorts for Time Allocation, Not Content Delivery
The value of cohort-based training is **permission to learn**.

- Engineers ($200+/hour) won't watch 20 hours of YouTube videos, but will attend a 2-day session their manager scheduled
- Calendar commitment matters more than content format
- Peer learning creates social proof for skeptical engineers

### 3. Plans as the Foundation
The **plan-first workflow** appears throughout the curriculum and methodology.

- 800+ line plans for complex features, plan.md as the first PR
- Plans keep agents on track during sessions
- Without a plan, context degrades and agents drift

### 4. Observing Invisible Bad Habits
Engineers don't realize how poorly they use AI until someone watches them.

- Building multiple features in one thread, never refreshing context, treating AI as autocomplete
- These observations change behavior immediately

### 5. Office Hours as a Sensor System
Office hours serve as **discovery before curriculum development**.

- Questions from users, not assumptions
- Validation before investing in full course development
- Feeds content generation, persona identification, and product feedback

### 6. Copy-Paste Ready Content
Every piece of content should be **immediately usable**.

- Custom commands, pre-commit hooks, MCP server setups, AGENTS.md templates ready to paste
- If users can't paste and use it, the content needs refinement

### 7. The AI Champion Role
Teams need someone responsible for **maintaining AI readiness**.

- Curates AGENTS.md files, sets up pre-commit hooks, establishes AI-native workflows
- Without this role, adoption stalls after initial training

### 8. Persona-Based Segmentation
Segment by **career stage AND domain AND tool integrations**.

- Personas have needs and engagement patterns
- Write content for engagement personas first

### 9. Certified Affiliates for Scale
Distribution through **certified partners**.

- Affiliates complete the same training as enterprise customers, handle mid-market companies
- Submit feedback summaries (sensor function)
- Cursor gets reach; affiliates get brand, curriculum, and credits

### 10. Education as Product Sensor
Training sessions reveal **ground truth that social media cannot**.

- Sessions show engineers on codebases
- Reveals which features engineers discover vs. ignore, surfaces friction points
- The education team becomes an asset for product development

### 11. Market-Driven Validation
**Let engagement metrics decide what to build.**

- Track engagement metrics (attendance, questions, shares, copy-paste usage)
- Build curriculum tracks for engagement segments
- Sell what the market has already validated through engagement

### 12. Validation Before Lock-Down
**Month 2 validates, Month 3 locks and scales.**

- Month 1: Foundation, Month 2: Validation, Month 3: Lock down curriculum then execute in parallel
- By Month 3, curriculum is validated through feedback

---

## The Work Trial Scope

Based on our conversation, this deliverable addresses:

1. **Curriculum Design** - Structure (not detailed, as features change)
2. **Program Structure** - How to deploy training (cohort size, format, duration)
3. **Target Strategy** - Which companies/sectors to prioritize
4. **Team Structure** - How many instructors, what roles needed
5. **Success Metrics** - How to measure impact (token spend increase)
6. **90-Day Roadmap** - What happens day 1, week 1, month 1-3
7. **Feature Recommendations** - Product features that would make teaching easier

**The framing:** Imagine you're in the job on day one. The goal is to increase token spend for Cursor Enterprise. What do the first 90 days look like?

---

## Strategic Foundation

I'm bullish on cohort-based training. My general playbook has been:

1. **Start with office hours** - These sessions attract 200-1,000 participants and generate blog posts that reach hundreds of thousands of readers.

2. **Use office hours to create content** - Sessions are transcribed, analyzed, and turned into newsletters, FAQs, and blog posts.

3. **Use content and office hours to curate champions** - Identify participants who become either:
   - Champions within enterprise companies
   - Affiliates who are educators

4. **Use Lunch and Learns as a hub** - A version of office hours. While office hours might have 200-1,000 people, Lunch and Learns have 20-30 people who each represent thousands of people—either at their company or through their own audience.

More details on each of these components appear later in this document.

---

## Discovery & Validation: Office Hours as Curriculum Sensor

Office hours serve as discovery before curriculum development. Questions from users, not assumptions.

### Office Hours Model

**Format:** 1-hour sessions, rotating personas (career stage OR domain/role OR tool integration)

**Personas:** Career stage (college students, junior engineers, senior engineers, PMs, designers), Domain (data science, front-end, back-end, full-stack, DevOps), Tool integrations (Figma MCP, Linear, JIRA, GitHub, Slack, browser, database)

**Structure:** Q&A, participants bring codebase problems, troubleshooting, recorded for transcripts. Co-host facilitates, invited guests provide expertise, champion talks (5-10 min demos). Tool/provider sessions: Part 1 (developer integration), Part 2 (provider's internal use).

**Output:** Transcripts feed content, identifies champions, validates curriculum topics, reveals product gaps

### Content Generation Pipeline

**Office Hours → Transcripts → Content**
- Record, transcribe (Granola, Otter), extract questions/answers/patterns
- Write newsletter articles, FAQs, tutorials, blog posts
- Create 2-minute videos for feature launches (ads)

**Copy-paste ready format:** Every piece of content includes code/prompts readers can paste into Cursor immediately. Examples: Custom commands (code for `.cursor/commands/`), pre-commit hooks (configs), MCP server setups (configurations), AGENTS.md templates. Format: Explanation → "Try it now" section → Expected output → Troubleshooting tips. If users can't paste and use it, content needs refinement.

**Content → Validation**
- Track engagement per persona: attendance, questions asked, return rate, content engagement
- Identify engagement personas (by career stage AND domain)
- Write content for engagement personas first

**Validation → Persona-Specific Content**
- Create tracks: Career stage (college students, junior engineers, senior engineers, PMs, designers), Domain (data science, front-end, back-end, full-stack, DevOps), Tool/provider (Figma MCP, Linear, JIRA, etc.)
- Tool/provider tracks cover: (1) How developers use MCPs with Cursor, (2) How provider companies use Cursor internally
- Adjust office hours rotation based on engagement
- Build curriculum modules from validated content

### Why This Approach Works

**For curriculum:** Questions from users, validation before investing in course development, feedback loop, persona-based approach identifies engagement, copy-paste ready format provides validation

**For product:** Office hours reveal product gaps, content tests product messaging, FAQs become product documentation

**For business:** Office hours create relationships with potential enterprise customers, content marketing drives inbound interest, newsletter builds email list

### Market-Driven Validation

**Process:** Put out content portfolio across all personas → Track engagement metrics → Identify engagement segments → Build curriculum tracks for those segments → Sell what market validated

**Metrics:** Office hours attendance, questions, content shares, return rate, copy-paste usage

**Example:** Week 1 (college students) → Week 2 (data science (75% return rate) → Week 4 front-end (80% return rate) → Week 5 Figma MCP (85% return rate). Analyze engagement, write persona-specific content, prioritize engagement segments for curriculum.

**Output:** Curriculum priorities determined by market engagement, not assumptions

### Success Metrics

**Office Hours:** 20-30 participants/session, 80%+ satisfaction, 3-5 insights/session, 50%+ return rate

**Content:** Newsletter 30%+ open rate, 5%+ click rate, 100+ FAQs answered, 1,000+ views/post

**Curriculum:** 80%+ topics validated through office hours, engagement personas identified by Week 6, 10+ case studies


## AI for Staff Engineering Curriculum

**Revenue goal:** Generates ~$90,000 per session. Target: Run once per month.

**Approach:** Teach habits and mental models that remain useful as tools evolve. AI-generated code must be reviewable (commits, diffs, no artifacts). Material adopted from staff engineering course.

**Live coding:** Build applications from transcript to deployed, demonstrating workflows.

**Module 1: Planning Mastery** - Requirements gathering, 800+ line plan.md as first PR, PM-first workflow, refresh context frequently

**Module 2: Repository Configuration** - AGENTS.md, pre-commit/pre-push hooks, AI champion role

**Module 3: Custom Commands** - Turn instructions into slash commands (`/de-slop`, `/gh-commit`, `/gh-fix-ci`), team command libraries

**Module 4: Agent Toolkit Development** - CLI tools AI invokes to test its own work, build code you'd never write yourself (load testing, mock seeders)

**Module 5: MCP Integration** - Linear/JIRA MCP for ticket context, `/make-linear-ticket` command, Chrome DevTools MCP

**Module 6: Asynchronous Workflows** - Background agents for work (docs, linting, fixes), connecting to Slack, evidence requirements

**Module 7: Team Integration** - AI champion responsibilities, Slack integrations, PR workflow standardization

---

## How to Grow: The 2x4 Grid

Two grids drive customer acquisition: what **Cursor** initiates and what **others** amplify.

| Cursor Initiates | Others Amplify |
|------------------|----------------|
| Cold Inbound (sales team leads) | Employees (office hours, talks, videos) |
| Cold Outbound (enterprise with low usage) | Customers/Champions (lunch and learns, testimonials, Cursor Cafes) |
| Warm Inbound (nurture from events) | Affiliates (mid-market training, content) |
| Content (ads, videos, newsletters) | Agencies (support) |

---

### Cursor Team Responsibilities

**Focus:** Fortune 500 enterprise training, curriculum development, accounts.

| Role | Activities |
|------|------------|
| Enterprise training | Deliver 2-3 day cohort sessions (20-500 engineers) |
| Content | Videos on differentiating features, copy-paste tutorials, FAQs |
| Community | Office hours with product/engineering guests, conference talks |
| Intelligence | Champion identification, product feedback synthesis |

---

### Affiliates (Certified Partners)

**Focus:** Extend reach below Cursor's focus line while maintaining standards through certification.

| Who | What They Do |
|-----|--------------|
| Consulting firms | Training for mid-market clients |
| YouTube creators | Content at scale |
| PE funds | Company training programs |
| Training companies | Workshops for their client base |

**Affiliate obligations:** Feedback summaries, lunch-and-learn participation, certification maintenance.

---

### Customers/Champions

**Focus:** Word-of-mouth and community building.

- **Lunch and learns:** Customers attend as champions, provide feedback
- **Testimonials:** Case studies, success stories, social proof
- **Cursor Cafes:** Host local meetups and user groups
- **Referrals:** Recommend to partners, vendors, industry peers

---

### Agencies

**Support:** Video ads and content (when needed).

---

## Education Programs

**Execution Timeline:**
- **Month 1:** Foundation - Office Hours, Self-Serve Content, Champion Identification
- **Month 2:** Validation - Affiliate Certification, Lunch and Learns, AI Content
- **Month 3:** Lock Down & Scale - Curriculum finalized, enterprise training, affiliate training, video production (parallel)

---

## Month 1: Foundation

### Program 1: Office Hours

**Format:** 1-hour sessions, rotating personas each week

- Q&A, participants bring codebase problems
- Record for transcript analysis
- Co-host facilitates, invited guests provide expertise
- Champion talks: 5-10 minute coding demos

**Persona rotation:** Career stage OR domain/role. Track engagement metrics. Identify engagement personas for more frequent sessions.

**Output:** Transcripts feed newsletters/FAQs/blog posts. Identifies champions. Validates curriculum topics.

**Milestones:** Program operational (4 sessions Month 1), engagement personas identified (Week 6)

---

### Program 2: Self-Serve Content

**Format:** Content (Cursor Learn, blog posts, newsletters)

- Copy-paste ready blog posts and newsletters
- FAQs and tutorials
- Video content from office hours

**Output:** Lead generation, SEO, content funnel for affiliates. Office hours transcripts become self-serve content.

**Milestones:** Content generation pipeline established (Month 1), newsletter launched (2 issues Month 1)

---

### Program 3: Champion Program

**Format:** Identify users who become advocates, speakers, certified instructors

**Identification:** Asks questions showing understanding, demonstrates workflows (custom commands, MCP servers, sub-agents), helps others, engagement

**Output:** Content creation, testimonials, case studies, referrals to enterprise program. Champions can become certified affiliates.

**Milestones:** Champions identified (Month 1), champions attend lunch and learns (Month 2)

---

## Month 2: Validation

### Program 4: Certified Affiliate Program

**Who:** YouTube creators, training companies, PE funds, consulting firms, educators

**Certification:** Application → Enterprise training → Pass assessments → Receive badge → Public directory

**Requirements:** Feedback summaries, lunch and learns, maintain standards, use certified curriculum

**Output:** Distribution to companies, feedback summaries, extended reach, scales training without scaling team

**Milestones:** Affiliate program structure designed (Month 2), affiliate program operational (Month 3)

---

### Program 5: Lunch and Learns

**Format:** Sessions (1-2 hours). Champions + Affiliates together.

**Participants:** Champions from enterprise accounts, certified affiliates, Cursor education team, product team

**Format:** Discussion, Q&A, product roadmap previews, practice sharing, recorded

**Output:** Feedback from tens of thousands of users, product insights, content assets, curriculum updates

**Milestones:** First lunch and learn completed (Month 2)

---

### Program 6: AI Educational Content

**Format:** Blog posts copy-pasted into Cursor. Paste URL, Cursor configures environment.

**Topics:** Pre-commit hooks, CLI tools, Git subcommands, PR formatting, MCP server setup

**Output:** Product demos in IDE, trackable usage data, brand control

**Milestones:** AI content pipeline established (Month 2)

---

## Month 3: Lock Down & Scale

**Curriculum finalized. Everything runs in parallel.**

### Program 7: Parallel Execution

**Enterprise Training:** 2-3 day cohort sessions for Fortune 500 teams (20-500 engineers). Modules 1-7, exercises, deliverables (AGENTS.md, custom commands, MCP configs, AI champion)

**Affiliate Training:** Certify affiliates to deliver curriculum. Affiliates handle mid-market and companies.

**Video Production:** Videos on differentiating features, office hours recordings, lunch and learn highlights, copy-paste tutorials

**Content at Scale:** Initialization blog posts, content library, case studies, newsletter

**Output:** Token spend increase (40% within 90 days), reference customers, extended reach, content library, product feedback

**Milestones:** Curriculum locked and validated (Month 3), enterprise training sessions delivered (Month 3), video production and content at scale running in parallel (Month 3)

---

## Success Metrics

### Metric: Token Spend Increase

**Target:** 40% increase in token spend within trained accounts within 90 days of program completion.

**Why this metric matters:** Many people claim to use Cursor, but watching them work reveals they're just working *in* Cursor without leveraging its capabilities. The difference between usage and AI-assisted development shows up directly in token spend.

**Measurement approach:**

Through affiliate and enterprise programs, we know the accounts of every participant. This creates a measurement path:

1. **Credit allocation:** Give each participant $100 in credits upon program enrollment
2. **Track spend velocity:** Measure how quickly participants consume their $100 credits
3. **Correlate with outcomes:** Use data science to determine whether credit consumption speed predicts:
   - Customer lifetime value (LTV)
   - Retention rates
   - Spend increases

**AI education tracking:**
- Track accounts that have loaded/installed course agents
- Agent installation provides attribution without requiring email matching

**Note on attribution:** Skip attribution for content (lunch and learns, newsletters, etc.) in the term. Focus measurement on programs where we have account visibility: enterprise training, affiliate cohorts, and AI education.

---

## Team Structure

### Core Team

- **Jason Liu** - Curriculum, enterprise delivery, affiliate certification, data science
- **Video/Production** - Recording, editing, content creation
- **Operations** - Scheduling, logistics, tracking
- **Community** - Lunch and Learn quality, affiliate relationships

### Scaling Through Affiliates

Core Cursor team handles enterprise accounts directly.

Certified affiliates serve EMEA and APAC. They run Lunch and Learns and enterprise sessions. This scales training without scaling headcount.

---

## 90-Day Roadmap

### Month 1: Foundation
- Office hours program operational (4 sessions)
- Content generation pipeline established
- Newsletter launched (2 issues)
- Champions identified

### Month 2: Validation
- Affiliate program structure designed
- First lunch and learn completed
- AI content pipeline established
- Engagement personas identified
- Hiring: Video/Production, Operations

### Month 3: Lock Down & Scale
- Curriculum locked and validated
- Enterprise training sessions delivered
- Affiliate program operational
- Video production and content at scale running in parallel
- Hiring: Community (Lunch and Learn quality, affiliate relationships)

## Conclusion

The opportunity: Cursor's enterprise customers want to adopt AI development but lack the structure and expertise to do it well. An education program fills this gap while driving the metric that matters most: token spend.