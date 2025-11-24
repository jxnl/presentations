# Add User Authentication

## Goals
- Add login/logout functionality
- Protect routes that require authentication
- Store user sessions securely

## Tasks
- Create `src/auth/login.tsx` (new file)
- Create `src/auth/logout.tsx` (new file)
- Update `src/routes.tsx` (add auth middleware)
- Update `src/components/Header.tsx` (add login/logout buttons)

## Expected Outcome
- Users can log in and log out
- Protected routes redirect to login if not authenticated
- Session persists across page refreshes
