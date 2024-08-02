# Helpful commands

- `supabase gen types typescript --local > ./src/types/schema.ts` - Generate types for local setup
- `supabase link --project-ref <PROJECT_REF>` - Connect your supabase cli with your remote instance
- `[supabase db diff](https://supabase.com/docs/reference/cli/supabase-db-diff)` - identify diffs (like updated policies in the UI) between local and remote
- [`supabase db reset`](https://supabase.com/docs/reference/cli/supabase-db-reset) - apply database migration locally
- [`supabase db push`](https://supabase.com/docs/reference/cli/supabase-db-push) - push local migrations to remote

## Edge functions

- `supabase functions serve <function_name> --no-verify-jwt` - for local development
- `supabase functions deploy` - deploy all functions to production
- `supabase functions deploy <function_name>` - deploy specfic function to production

## Local dummy user

For creating a local user u can register once, dump the data and seed it via `seed.sql `

- Dump via `pg_dump postgresql://postgres:postgres@localhost:54322/postgres --data-only --inserts --column-inserts -n public -n auth > backup.sql`
- copy lines `auth.users` and `auth.identities` into `seed.sql`

## Dump local database

- connect with `psql <DB_URL>`to your db
- find `<DB_URL>`> via `supabase status`
- use `pg_dump <DB_URL>` for exporting db and `pg_restore -d <DB_URL>`for importing
  - `pg_dump postgresql://postgres:postgres@localhost:54322/postgres -N _realtime -N _analytics > backup.sql  `
