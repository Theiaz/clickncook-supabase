# clickncook-supabase

[![Netlify Status](https://api.netlify.com/api/v1/badges/ef79e64d-48f1-4ad6-9461-328b06b86385/deploy-status)](https://app.netlify.com/sites/jolly-cocada-5deecb/deploys)
[![CI](https://github.com/Theiaz/clickncook-supabase/actions/workflows/ci.yaml/badge.svg)](https://github.com/Theiaz/clickncook-supabase/actions/workflows/ci.yaml)

## Setup

### Connect to your local supabase instance

1. Setup supabase [locally](https://supabase.com/docs/guides/cli/local-development) and start your local environment with `supabase start`
1. Have a look at the dashboard http://localhost:54323/project/default
1. Create a environment file `env.local` which contains the local supabase credentials
   ```txt
   VITE_SUPABASE_URL=http://localhost:54321
   VITE_SUPABASE_ANON_KEY=<anon api key>
   ```
1. Run `npm run dev`

### Connectt your remote supabase instance

1. Create a environment file `.env` which contains the remote supabase credentials
   ```txt
   VITE_SUPABASE_URL=<remote supabase url>
   VITE_SUPABASE_ANON_KEY=<anon api key>
   ```
2. Connect your supabase cli with your remote instance `supabase link --project-ref <PROJECT_REF>`

## Local development and environment

### Dump local database

- connect with `psql <DB_URL>`to your db
- find `<DB_URL>`> via `supabase status`
- use `pg_dump <DB_URL>` for exporting db and `pg_restore -d <DB_URL>`for importing
  - `pg_dump postgresql://postgres:postgres@localhost:54322/postgres -N _realtime -N _analytics > backup.sql  `

### Local dummy user

For creating a local user u can register once, dump the data and seed it via `seed.sql `

- Dump via `pg_dump postgresql://postgres:postgres@localhost:54322/postgres --data-only --inserts --column-inserts -n public -n auth > backup.sql`
- copy lines `auth.users` and `auth.identities` into `seed.sql`

### Generate types for local setup

- `supabase gen types typescript --local > ./src/types/schema.ts`

## Staging and production

For each environment we got a separate supabase project:

- dev/local environment on your computer
- [staging environment](https://staging--jolly-cocada-5deecb.netlify.app/) (branch `staging`)
- [production environment](https://jolly-cocada-5deecb.netlify.app/) (branch `main`)

For the last two environments a [github action automatically deploys new migrations](https://supabase.com/docs/guides/cli/managing-environments?environment=staging#deploy-a-migration) to the related supabase project.

### Useful commands

- Connect your supabase cli with your remote instance `supabase link --project-ref <PROJECT_REF>`
- identify diffs (like updated policies in the UI) between local and remote: [supabase db diff](https://supabase.com/docs/reference/cli/supabase-db-diff)
- apply database migration locally [`supabase db reset`](https://supabase.com/docs/reference/cli/supabase-db-reset)
- push local migrations to remote [`supabase db push`](https://supabase.com/docs/reference/cli/supabase-db-push)

## Edge functions

-  `supabase functions deploy` deploy all functions to production
-  `supabase functions deploy <function_name>` deploy specfic function to production