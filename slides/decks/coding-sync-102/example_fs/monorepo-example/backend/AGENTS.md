# Backend Rules

## API Conventions
- Use FastAPI for all endpoints
- Return Pydantic models, not dicts
- Handle errors with HTTPException

## Database
- Use SQLAlchemy async sessions
- Migrations via Alembic
