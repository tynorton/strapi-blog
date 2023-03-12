# Strapi (v4) Headless CMS & Next.JS Blog

This is a playground for Strapi CMS, and Next.JS Front-End sample code, wrapped in docker. The current Strapi blog examples are hard to get running without some intimate knowledge of NodeJS.

## Building this sample

The sample is comprosed of two components. The `backend` is a headless Strapi CMS instance, and the `frontend` is a Next.JS client to display the CMS data The data in this case is content for a blog.

## Docker Build (Recommended)

This is the easiest, and preferred way to run the sample.

_Please Note: `--network=host` argument is **required** to ensure the frontend can talk to the backend. The frontend will not even start without this._

### `build & run backend`

Working Directory `strapi-blog/backend`

```bash
docker build -t bsd-backend .
docker run -d --network=host bsd-backend:latest
```

This will take some time, and you can watch the logs waiting for the startup.

```bash
docker logs --follow bsd-backend
```

You're looking for some output like

```text
...

Welcome back!
To manage your project 🚀, go to the administration panel at:
http://0.0.0.0:1337/admin

To access the server ⚡️, go to:
http://0.0.0.0:1337

...
```

### `build & run frontend`

Wait for the backend to start fully, then run the front-end. This is important because part of the container initialization routine will issue an API call to Strapi.

Working Directory `strapi-blog/frontend`

```bash
# Build with the host network, so Strapi APIs are accessible at compile time, or build will fail
docker build --network=host -t bsd-frontend .

# Run with the host network, so Strapi APIs are accessible
docker run -d --network=host bsd-frontend:latest
```

## Manual Build

The easiest way to get up and running is by running both components with `develop` using `yarn`.

Open two terminals, and run the commands below.

Working Directory `strapi-blog/backend`

```bash
yarn develop
```

Working Directory `strapi-blog/frontend`

```bash
yarn develop
```

## Running

After completing a successful build, you should be able to access both web interfaces.

* http://localhost:1337/admin (Strapi CMS Admin)
* http://localhost:3000 (Next.JS Blog UI)

## Build Command Reference

Both frontend and backend support manual builds with npm/yarn.

## `develop`

Builds & runs the current module

```bash
npm run develop
# or
yarn develop
```

## `start`

Runs the current module

```bash
npm run start
# or
yarn start
```

## `build`

Builds the current module

```bash
npm run build
# or
yarn build
```

## Misc Notes

As of 03/2023, the next-blog starter template is **broken** if you use NodeJS 18.

The `frontend` component still requires NodeJS 16, while the `backend` requires NodeJS 18. We can work around this issue with the `nvm` command.

## `backend`

Next.JS frontend currently requires NodeJS 18.

### Set up dev environment

Working Directory `strapi-blog/backend`

```bash
# Install latest NodeJS 18
nvm install 18

# Change NodeJs version to 18 (Replace with your version)
nvm use 18.x.x

# install yarn globally for NodeJS 18
npm install yarn -g
```

### Start a `backend` development instance

Working Directory `strapi-blog/`

```bash
yarn run develop:backend
```

## `frontend`

Next.JS frontend currently requires NodeJS 16.

### Set up dev environment

Working Directory `strapi-blog/frontend`

```bash
# Install latest NodeJS 16
nvm install 16

# Change NodeJs version to 16 (Replace with your version)
nvm use 16.x.x

# install yarn globally for NodeJS 16
npm install yarn -g
```

### Start a `frontend` development instance

Working Directory `strapi-blog/`

```bash
yarn run develop:frontend
```
