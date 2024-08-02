# Environments

This app supports a local development setup aswell as multiple remote stages (staging and production).

For each environment we got a separate supabase project:

- local environment on your computer for development
- staging environment (branch `staging`) for testing
- production environment (branch `main`) for the productive app

For the last two environments a github action [automatically deploys new supabase migrations](https://supabase.com/docs/guides/cli/managing-environments?environment=staging#deploy-a-migration) to the related supabase project.

## Local setup

For development you can use a local supapbase instance following these instructions:

1. Setup supabase [locally](https://supabase.com/docs/guides/cli/local-development) and start your local environment with `supabase start`
2. Have a look at the dashboard http://localhost:54323/project/default
3. Create a environment file `env.local` which contains the local supabase credentials
   ```txt
   VITE_SUPABASE_URL=http://localhost:54321
   VITE_SUPABASE_ANON_KEY=<anon api key>
   ```
4. Run `npm run dev`

## Connect your remote supabase instance

1. Create a environment file `.env` which contains the remote supabase credentials
   ```txt
   VITE_SUPABASE_URL=<remote supabase url>
   VITE_SUPABASE_ANON_KEY=<anon api key>
   ```
2. Connect your supabase cli with your remote instance `supabase link --project-ref <PROJECT_REF>`
