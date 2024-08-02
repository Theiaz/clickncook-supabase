# Selfhosting

For hosting this app on your own you have to use supabase as a backend, netlify for hosting of the frontend and github actions as CI/CD.

## Setup backend and CI/CD pipeline

1. Fork this project within github
2. Create two supabase projects (one for production environment, one for staging).
3. Remember for each of the project the database password and its project id
4. Create a personal access token for the CI/CD pipeline within supabase ![](/docs/resources/access_token.png)
5. Configure the following secrets of your github project
   ![](/docs/resources/github_envs.png)
   - `PRODUCTION_PROJECT_ID`
   - `PRODUCTION_DB_PASSWORD`
   - `STAGING_PROJECT_ID`
   - `STAGING_DB_PASSWORD`
   - `SUPABASE_ACCESS_TOKEN`
6. Manually run the CI workflow ![](/docs/resources/workflow.png)

The CI/CD pipeline pushes the configuration to your supabase projects. You should see some database tables.

   ![](/docs/resources/supabase_tables.png)

## Deploy the app on netlify

1. Create a new netlify project
2. Connect your github repository and deploy it ![](/docs/resources/netlify_deploy.png)
3. Open the URL of your created project. You got a blank page, because we need to configure some environment variables for your netlify project first
4. Open the environment variable settings page and create the following two variables. Use your project anon key and your project URL. One for production and one for staging environment.
   ![](/docs/resources/netlify_envs.png)
   - `VITE_SUPABASE_ANON_KEY`
   - `VITE_SUPABASE_URL`
5. Clear the cache and redeploy your netlify project

Now the blank page should be gone and you should see the app instead.

## Configure Auth

As a last step we want to be able to create our own recipes. Therefore, it is necessary to register usings supabase auth mechanism.

All you need to do it to configure the redirection URL using your netlify app URL.
![](/docs/resources/supabase_redirect.png)

You should be able to create a user for app using the registration form. Once submitted you should get an email with the registration confirmation link. After confirmation you should be able to login and create a new recipe.
