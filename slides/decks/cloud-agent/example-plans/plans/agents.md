# Cloud Cursor Agent - Project Instructions

This project uses Cloud Cursor Agent CLI to automate development tasks. This file provides instructions for AI agents working on this codebase.

## Getting Started

### Prerequisites

- Node.js v18 or higher
- Cursor API key set as `CURSOR_API_KEY` environment variable
- Cloud Cursor Agent CLI installed: `npm install -g cloud-cursor-agent`

### Launching Agents

Launch an agent with a plan file:

```bash
cloud-cursor-agent launch --plan plan/bugs/bug-001.md
```

Or use heredoc syntax for quick tasks:

```bash
cloud-cursor-agent launch --plan - <<EOF
# Quick Fix

## Goals
- Fix the issue

## Tasks
- Update the code

## Expected Outcome
- Issue resolved
EOF
```

## Plan Organization

Plans are organized in the `plan/` directory by category:

```
plan/
├── bugs/           # Bug fixes and patches
├── features/       # New feature implementations
├── refactors/      # Code refactoring tasks
└── docs/           # Documentation updates
```

### Plan Naming Convention

- Bugs: `bug-XXX.md` (e.g., `bug-001.md`, `bug-002.md`)
- Features: `feature-<name>.md` (e.g., `feature-auth.md`, `feature-payments.md`)
- Refactors: `<description>.md` (e.g., `extract-validation.md`, `migrate-to-typescript.md`)
- Docs: `<topic>.md` (e.g., `api-documentation.md`, `setup-guide.md`)

## Plan Structure

All plans must follow this structure:

```markdown
# Task Title

## Goals
- What you're trying to accomplish
- Specific objectives
- Success criteria

## Tasks
- Step 1: Create/modify file X
- Step 2: Update function Y
- Step 3: Add tests
- Step 4: Update documentation

## Expected Outcome
What the result should look like
- Specific deliverables
- Test coverage requirements
- Documentation updates needed
```

## Project Conventions

### Code Style

- Follow existing code style in the repository
- Use TypeScript for new files
- Follow ESLint and Prettier configurations
- Write tests for all new functionality

### File Organization

- Source code: `src/`
- Tests: `tests/` or `__tests__/`
- Configuration: Root level or `config/`
- Documentation: `docs/` or inline comments

### Git Workflow

- Create feature branches: `feature/<description>`
- Create bugfix branches: `fix/<description>`
- Write clear commit messages
- Open pull requests for review

## Parallelization Rules

**CRITICAL:** Only launch agents that modify completely different files.

### Safe to Parallelize

- Plan 1 modifies `src/auth.ts`
- Plan 2 modifies `src/api.ts`
- Plan 3 creates `src/utils.ts`

**No file overlap = Safe**

### Cannot Parallelize

- Plan 1 modifies `src/auth.ts` (lines 1-50)
- Plan 2 modifies `src/auth.ts` (lines 51-100)

**Same file = Cannot parallelize**

### Phased Approach

For large refactorings touching the same files:

1. **Phase 1:** Extract code to new files
2. **Phase 2:** Update callers (can parallelize if different files)
3. **Phase 3:** Remove old code

Launch phases sequentially, parallelize within phases if different files.

## Common Patterns

### Bug Fix Pattern

```markdown
# Fix [Issue Description]

## Goals
- Fix the bug
- Add test coverage
- Ensure no regressions

## Tasks
- Identify root cause
- Implement fix
- Add test case
- Update documentation if needed

## Expected Outcome
- Bug is fixed
- Test passes
- No regressions introduced
```

### Feature Addition Pattern

```markdown
# Add [Feature Name]

## Goals
- Implement feature X
- Add tests
- Update documentation

## Tasks
- Create feature module
- Add API endpoints (if backend)
- Add UI components (if frontend)
- Write integration tests
- Update API docs

## Expected Outcome
- Feature is complete
- All tests pass
- Documentation updated
```

### Refactoring Pattern

```markdown
# Refactor [Component/Module]

## Goals
- Improve code organization
- Reduce duplication
- Maintain functionality

## Tasks
- Extract common code
- Update all callers
- Run tests
- Verify no behavior changes

## Expected Outcome
- Code is cleaner
- All tests pass
- No functionality changes
```

## Best Practices

1. **Be Specific:** Clearly describe what needs to be done
2. **Break Down Tasks:** Large tasks into smaller, actionable steps
3. **Define Success:** Clearly state expected outcomes
4. **Consider Dependencies:** Note any dependencies between tasks
5. **Review Plans:** Review plans before launching agents
6. **Monitor Progress:** Use `watch` command to track agent progress
7. **Iterate:** Use `followup` command to refine agent work

## Agent Management

### Watch Agents

```bash
# Single agent
cloud-cursor-agent watch <agent-id>

# Multiple agents
cloud-cursor-agent watch <id1> <id2> <id3>
```

### Check Status

```bash
cloud-cursor-agent status <agent-id> --non-interactive
```

### Send Follow-up Instructions

```bash
cloud-cursor-agent followup <agent-id> "Please add error handling"
```

### List All Agents

```bash
cloud-cursor-agent list --non-interactive
```

## Troubleshooting

### Agent Failed

1. Check agent status: `cloud-cursor-agent status <id> --non-interactive`
2. View conversation: `cloud-cursor-agent conversation <id> --non-interactive`
3. Review the plan for clarity
4. Use followup to provide more context
5. If needed, cancel and relaunch with improved plan

### Parallelization Conflicts

If agents conflict:
1. Cancel conflicting agents: `cloud-cursor-agent cancel <id>`
2. Review plans for file overlap
3. Use phased approach if same files need changes
4. Relaunch with corrected plans

## Resources

- Cloud Cursor Agent GitHub: https://github.com/cursor/cloud-cursor-agent
- CLI Help: `cloud-cursor-agent --help`
- Command Help: `cloud-cursor-agent <command> --help`
