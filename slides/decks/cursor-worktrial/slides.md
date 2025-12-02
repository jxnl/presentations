---
theme: default
title: Cursor Enterprise Education
fonts:
  sans: 'Open Sans'
  provider: google
info: |
  ## Cursor Enterprise Education
  A methodology for building education in fast-moving markets
class: text-left
mdc: true
transition: none
---

# Cursor Enterprise Education

How to build curriculum when everything keeps changing

**Prepared by:** Jason Liu

<!--
This is a story about methodology. How do you build an education program when features ship weekly and best practices evolve monthly? You can't afford to guess. I'm going to show you how I think about this problem.
-->

---

# The Opportunity

- Over 60% of Fortune 500 companies use Cursor
- Most engineers never exceed their $20 spend limit
- They have the tool but use it like autocomplete
- CTOs mandate "use AI more" but provide no structure

<!--
Here's the opportunity. Over 60% of Fortune 500 companies have Cursor. But look at the usage data - most engineers never exceed their $20 limit. They have the tool installed, but they're not getting value from it. CTOs are mandating "use AI more" but providing no structure for how.
-->

---

# The Challenge

- Features ship weekly
- Best practices evolve monthly
- Traditional curriculum becomes obsolete before it launches

How do you build education in a fast-moving market?

<!--
Here's the fundamental challenge. Cursor ships new features constantly. What works today might not be the best approach tomorrow. If you spend six months building a course, half of it is outdated by launch. So how do you build education that stays relevant?
-->

---

# The Insight

- Don't guess what to teach
- Use sensors
- Let the market tell you what matters

<!--
The insight is simple: don't guess. Instead, set up sensors. Create mechanisms that tell you what the market actually needs, what questions people actually have, what workflows actually work. Then respond to what you learn.
-->

---

# Invisible Bad Habits

Engineers don't realize how poorly they use AI until someone watches them work

- Building multiple features in one thread
- Never refreshing context
- Treating AI as autocomplete

These observations change behavior immediately

<!--
Here's what we discovered: engineers have invisible bad habits. They don't know they're doing things wrong until someone watches them code. They build multiple features in one thread until context degrades. They never refresh. They treat AI as autocomplete instead of an agent. Once you point this out, behavior changes immediately. But you have to observe it first.
-->

---

# Content as Sawdust

Content isn't the goal - it's the byproduct of discovery

- Every office hour generates transcripts
- Transcripts become blog posts, FAQs, tutorials
- Engagement on that content validates what matters

<!--
Here's how I think about content: it's sawdust. When you're doing the real work of discovery - running office hours, answering questions, helping people - content falls out naturally. Transcripts become articles. Q&A becomes FAQs. And then engagement on that content tells you what resonates. Content is validation, not the end product.
-->

---

# Copy-Paste Ready

Every piece of content must be immediately usable

- Custom commands for `.cursor/commands/`
- Pre-commit hook configurations
- MCP server setups
- AGENTS.md templates

If users can't paste and use it, the content needs refinement

<!--
There's a rule for all content: it must be copy-paste ready. Not explanations - actual code. Custom commands they can drop into their project. Pre-commit hooks they can install. MCP configurations they can use. If they can't paste it and see it work, we haven't done our job. This is also validation - if people aren't pasting and using it, the content isn't working.
-->

---

# The 90-Day Methodology

**Month 1:** Set up sensors

**Month 2:** Validate through content

**Month 3:** Lock down and deliver

<!--
This methodology unfolds over 90 days. The first month is about setting up sensors. The second month is about using content to validate what resonates. The third month is about locking down curriculum and delivering it. Let me walk through each phase.
-->

---

# Month 1: Set Up Sensors

- Office hours with rotating personas - 4 sessions operational
- Content generation pipeline running
- Newsletter launched - 2 issues
- Champion identification

These tell you what's working and what's not

<!--
Month 1 is about building your sensor system. Office hours become your primary discovery mechanism. You rotate personas each week - data scientists one week, front-end engineers the next - and you learn what questions each group has. You build a content pipeline so transcripts become articles. Newsletter launches with two issues. You identify champions who will become your amplifiers. Everything in month 1 is designed to collect signal.
-->

---

# Office Hours as Discovery

- 1-hour sessions, rotating personas each week
- Participants bring real codebase problems
- Record everything for transcript analysis
- Co-host facilitates, invited guests provide expertise
- Champion talks: 5-10 minute coding demos

<!--
Office hours are the core sensor. They're not just Q&A sessions - they're discovery. People bring real problems. You see where they struggle. A co-host facilitates while you focus on helping. Guests provide expertise on specific topics. Champions give short demos. The transcripts become your curriculum research. Questions from 200 users beat assumptions from 2 stakeholders.
-->

---

# Identifying Champions

- Asks questions that show deep understanding
- Demonstrates workflows others don't know (custom commands, MCP servers, sub-agents)
- Helps other participants
- High engagement, keeps coming back

Champions become affiliates or internal advocates

<!--
During office hours, you identify champions. These are people who ask questions that show real understanding. They demonstrate workflows - custom commands, MCP setups, agent patterns. They help other participants. They keep showing up. These champions become either affiliates who train others, or advocates inside their companies who push adoption.
-->

---

# Month 2: Validate Through Content

- Put out content across all personas
- Track engagement metrics - personas validated
- Let the market tell you what's important
- Write more for the segments that engage
- Affiliate program structure designed
- First lunch and learn completed
- AI content pipeline established
- Hiring: Video/Production, Operations

<!--
Month 2 is validation. You take the content that fell out of month 1 and you put it everywhere. Blog posts, newsletters, tutorials for different personas. Then you watch. Which personas show up? Which content gets shared? Which articles generate questions? The market tells you what matters. Affiliate program structure is designed but not launched. First lunch and learn brings champions and affiliates together. AI content pipeline produces paste-ready tutorials. You hire video/production and operations to prepare for scale.
-->

---

# Market-Driven Validation

Who's engaging more?

- Which personas show up consistently?
- What questions are they asking?
- What content is resonating?

This data motivates both product research and education

<!--
This is what validation looks like. You track engagement by persona, but it's not just about return rates. You ask: who's engaging more? What questions are they asking? What content is resonating? The answers tell you where to focus curriculum, but they also reveal product gaps. Data science engineers asking about notebook workflows? That's both a curriculum opportunity and a product feature request. This sensor system feeds both education and product development.
-->

---

# Lunch and Learns

- 20-30 people who each represent thousands
- Champions from enterprise accounts
- Certified affiliates
- Product team joins for roadmap previews

Feedback from tens of thousands of users in one room

<!--
Lunch and learns are a different kind of session. Instead of 200 random participants, you have 20-30 people who each represent thousands - either at their company or through their audience. Champions and affiliates together. Product team joins to preview roadmap. You get feedback that represents tens of thousands of users in a single hour.
-->

---

# AI Educational Content

Blog posts that configure Cursor when pasted

- Paste URL, Cursor configures the environment
- Pre-commit hooks, CLI tools, MCP setups
- Product demos happening inside the IDE
- Trackable - we know who installs what

<!--
There's a special category of content: AI educational content. These are blog posts where you paste a URL into Cursor and it configures your environment. Pre-commit hooks get installed. CLI tools get set up. MCP servers get configured. The education is happening inside the IDE, and we can track who installs what. This is both education and product demo in one.
-->

---

# Education as Product Sensor

Training reveals ground truth that social media cannot

- Which features engineers discover vs. ignore
- Where the friction points are
- What workflows people actually need

The education team becomes a product asset

<!--
Here's something important: education is a product sensor. When you watch engineers use Cursor in training, you see ground truth that social media can't reveal. You see which features people discover versus ignore. You see friction points. You see what workflows they actually need. The education team becomes an asset for product development, not just a cost center.
-->

---

# Month 3: Lock Down and Deliver

- Curriculum locked and validated through feedback
- Cohorts run the entire time - they get bigger and more opinionated
- Super Days with larger companies - 1 instructor, maybe 2 TAs
- Enterprise training sessions delivered
- Affiliate program operational
- Video production and content at scale running in parallel
- Hiring: Community

The gap from insight to teaching is days, not months

<!--
By month 3, you know what to teach because the market told you. Now you lock down the curriculum. Important: cohorts have been running the entire time - they're not new in month 3. But they get bigger and more opinionated as the curriculum solidifies. Month 3 specifically involves Super Days with larger companies. Format is 1 instructor, maybe 2 TAs. Enterprise training sessions are delivered. Affiliates are certified and delivering. Video production scales the validated content. Everything runs in parallel. You hire community to maintain lunch and learn quality and affiliate relationships.
-->

---

# Why Cohorts Over Videos

- Videos take months to produce
- Cohorts can launch in days
- When features change, cohorts adapt
- Videos become obsolete
- Cohorts are live - you respond in real time

<!--
This is the speed advantage of cohort-based training. Videos are slow to produce, hard to update, and become obsolete. Cohorts are fast. If a new feature ships, you incorporate it next session. If a workflow changes, you adjust. You're teaching live, responding to what's actually happening. The time from insight to teaching is minimal.
-->

---

# The Permission to Learn

- Engineers won't watch 20 hours of YouTube
- But they'll attend a 2-day session their manager scheduled
- The value isn't content format - it's calendar commitment
- Peer learning creates social proof for skeptical engineers

<!--
There's another reason cohorts work: permission. Engineers making $200 an hour won't invest personal time watching videos. But if their manager puts training on the calendar, they show up. The cohort creates permission to learn. Peer learning also creates social proof - skeptical engineers see their peers succeeding with these workflows.
-->

---

# The Curriculum Modules

- **Module 1:** Planning Mastery - 800+ line plan.md as first PR
- **Module 2:** Repository Configuration - AGENTS.md, pre-commit hooks
- **Module 3:** Custom Commands - turn instructions into slash commands
- **Module 4:** Custom Hooks - pre-commit, pre-push, automated checks
- **Module 5:** Agent Toolkit Development - CLI tools AI invokes
- **Module 6:** MCP Integration - Linear, JIRA, Chrome DevTools
- **Module 7:** Sub-Agents - breaking work into specialized agents
- **Module 8:** Asynchronous Workflows - background agents, Slack
- **Module 9:** Team Integration - AI champion role, PR workflows

<!--
The curriculum focuses on habits and mental models that persist even as features change. Planning with 800+ line plans. Repository configuration with AGENTS.md. Custom commands like /de-slop and /gh-commit. Custom hooks for automated checks. Building CLI tools that AI can invoke. MCP integrations. Sub-agents that break complex work into specialized pieces. Async workflows with background agents. Team integration with the AI champion role. These are stable concepts even when specific features evolve.
-->

---

# Optional Packs

- **Front-end Design and Browser Automation:** Chrome DevTools MCP, testing workflows, visual regression

- **Product Managers:** Spec writing, ticket creation, roadmap planning with AI
  - Skills: Git basics, dev workflow concepts, how to fit into engineering teams

- **Designers:** Figma MCP, design-to-code workflows, component generation
  - Skills: Agent prompts, AGENTS.md files, organizing design systems for coding agents

Core modules for everyone, packs for specific roles

<!--
Beyond the core modules, we offer optional packs for specific roles. Front-end Design and Browser Automation covers Chrome DevTools MCP, testing workflows, and visual regression. Product managers learn spec writing and ticket creation with AI, plus Git basics and dev workflow concepts so they can fit into engineering teams. Designers get Figma MCP and design-to-code workflows, plus agent prompts, AGENTS.md files, and how to organize design systems within for coding agents. Core modules are for everyone; packs customize for the team composition.
-->

---

# Optional Packs (continued)

- **Data Scientists:** Notebook workflows, data exploration, visualization pipelines
  - Skills: Working within Jupyter Notebooks, building CLIs and experimentation scripts, how to think about text as equal, making dashboards, doing more science and running experiments that you wouldn't have otherwise run
  - **Opportunity:** Slack agent in Cursor reading production code and executing SQL in production (agent mode, like Devin) as a way of scaling out data science and analytics

- **AI Engineers:** Model evaluation, prompt engineering, fine-tuning workflows
  - Skills: Writing evals, running tests, using AI to prompt engineer, making dashboards, doing more science and running experiments that you wouldn't have otherwise run
  - **Opportunity:** Using Cursor AEI agents to improve prompts for downstream tasks

<!--
Data scientists cover notebook workflows and visualization, plus working within Jupyter Notebooks, building CLIs and experimentation scripts, how to think about text as equal, making dashboards, and doing more science and running experiments that you wouldn't have otherwise run. There's an opportunity for the Slack agent in Cursor to read production code and execute SQL in production in some kind of agent mode, just like Devin, as a way of scaling out data science and analytics. AI engineers focus on writing evals, running tests, using AI to prompt engineer, making dashboards, and doing more science and running experiments that you wouldn't have otherwise run. The same thing can be done using Cursor AEI agents to improve prompts for downstream tasks.
-->

---

# Affiliate Types

- Consulting firms - training for mid-market clients
- YouTube creators - content at scale
- PE funds - portfolio company programs
- Training companies - workshops for their client base

Affiliates complete the same training as enterprise customers

<!--
Affiliates come in different types. Consulting firms train their mid-market clients. YouTube creators produce content at scale. PE funds run programs across portfolio companies. Training companies add Cursor to their workshop offerings. All of them complete the same training as enterprise customers. Same standards, same curriculum.
-->

---

# Affiliate Obligations

- Submit feedback summaries after each engagement
- Participate in lunch and learns
- Maintain certification standards
- Use the certified curriculum

Cursor gets reach; affiliates get brand, curriculum, and credits

<!--
Affiliates have obligations. They submit feedback summaries - this is the sensor function. They participate in lunch and learns. They maintain standards. They use the certified curriculum. In return, they get the Cursor brand, proven curriculum, and credits. We get reach without scaling headcount.
-->

---

# Team Structure

- **One main instructor:** Curriculum, enterprise delivery, affiliate certification
- **Two TAs:** Support during sessions
- **Video/Production:** Recording, editing, content creation
- **Operations:** Scheduling, logistics, tracking
- **Community organizers:** Act as MCs and drive conversations

<!--
The team structure includes one main instructor who handles curriculum, enterprise delivery, and affiliate certification. Two TAs provide support during sessions. Video/production handles recording and editing. Operations handles scheduling and logistics. Community organizers act as MCs and drive conversations during lunch and learns and other sessions.
-->

---

# Measuring Success

**Target:** 40% increase in token spend within trained accounts

**Attribution perspective:**

- Free content attribution is hard
- For cohorts: give each participant credits upon enrollment
- Track spend velocity - how quickly they consume credits
- Correlate with LTV, retention, spend increases

<!--
From an attribution perspective, free content is hard to measure. But for cohorts, we can give each participant credits upon enrollment. We track spend velocity - how quickly they consume those credits. Then we correlate that velocity with LTV, retention, and spend increases. This gives us clear attribution for cohort-based training.
-->

---

# The Methodology

On-demand doesn't work when content is changing all the time

- Define sensors that work with individual people
- Use content as the sawdust of those conversations
- Build a portfolio of sensors - use engagement to validate ideas
- Curate ideas, build cohorts for speed (can change overnight)
- Use cohorts to build out affiliates and self-serve model

All of this education is really just a sensor on the product

The reward is increased token spend, but the market tells you what to build

<!--
On-demand doesn't work when content is changing all the time. Instead, define sensors that work with individual people - office hours, lunch and learns, one-on-one sessions. Use content as the sawdust of those conversations - transcripts become articles, Q&A becomes FAQs. Build up a portfolio of sensors where you can use engagement on that content to validate various ideas. As we curate these ideas, we can build cohorts for speed because they can change overnight. Use that to build out affiliates and a self-serve model. But ultimately, all of this education is really just a sensor on the product. The reward is increased token spend, but ultimately the market tells you what you need to build.
-->

---

# Questions?

<!--
Thank you. This is how I think about building education when everything keeps changing. Sensors, validation, cohorts, then scale. Happy to discuss any part of this methodology.
-->
