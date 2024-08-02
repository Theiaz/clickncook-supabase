# clickncook-supabase

[![Netlify Status](https://api.netlify.com/api/v1/badges/ef79e64d-48f1-4ad6-9461-328b06b86385/deploy-status)](https://app.netlify.com/sites/jolly-cocada-5deecb/deploys)
[![CI](https://github.com/Theiaz/clickncook-supabase/actions/workflows/ci.yaml/badge.svg)](https://github.com/Theiaz/clickncook-supabase/actions/workflows/ci.yaml)

This is a progressive web app for your recipes using free tier of netlify and supabase. You can use the [hosted instance](https://jolly-cocada-5deecb.netlify.app/) or [deploy it yourself](#installation-for-self-hosting)!

# Table of Contents

- [Features](#features)
- [Setup](#setup)
- [Installation for self hosting](#installation-for-self-hosting)
- [Contributing](#contributing)
- [License](#license)

## Features

- ✅ image store with clientside image compression
- ✅ progressive web app (installable, app shortcuts)
- ✅ authentication and authorization with postgres Row Level Security
- ✅ multiple environment support (local, staging, production)
- ✅ E2E tests using playwright

## Setup

1. Clone or fork the repository:

   ```sh
   git clone git@github.com:Theiaz/clickncook-supabase.git
   cd clickncook-supabase
   ```

2. Install dependencies:

   ```sh
   npm install
   ```

3. Setup local supabase instance - follow this [instructions](/docs/environments.md)

## Installation for self hosting

If you want your own recipe app feel free to host it on yourself. A detailed guide can be found [here](/docs/selfhosting.md)

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any changes.

## License

This project is licensed under the MIT License. See the LICENSE file for details.
