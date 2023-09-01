# clickncook-supabase

## Dev Setup

### With local supabase instance

1. Setup supabase [locally](https://supabase.com/docs/guides/cli/local-development) and start your local environment with `supabase start`
1. Have a look at the dashboard http://localhost:54323/project/default
1. Create a environment file `env.local` which contains the local supabase credentials
   ```txt
   VITE_SUPABASE_URL=http://localhost:54321
   VITE_SUPABASE_ANON_KEY=<anon api key>
   ```
1. Run `npm run dev`

### With remote supabase instance

1. Create a environment file `.env` which contains the remote supabase credentials
   ```txt
   VITE_SUPABASE_URL=<remote supabase url>
   VITE_SUPABASE_ANON_KEY=<anon api key>
   ```
