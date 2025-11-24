# Extract Common Validation Logic

## Goals
- Find duplicate validation code across the codebase
- Extract to shared ValidationUtils module
- Update all callers to use the new module

## Tasks
- Create `src/utils/ValidationUtils.ts` module
- Extract common validation patterns
- Update 15+ files using old validation code
- Ensure all tests still pass

## Expected Outcome
- DRY code with no duplication
- All existing tests pass
- Consistent validation logic across the application
