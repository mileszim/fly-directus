# directus on fly.io

Run [Directus](https://directus.io/) on [fly.io](https://fly.io/).

## Getting started

1. Run `fly launch` to create a new app.
2. Clone this repository.
3. Update the `fly.toml` file:

   1. Replace `FLY_APP_NAME` with your app name.

4. Set `ADMIN_EMAIL` and `ADMIN_PASSWORD` as secrets:
  
   ```bash
   $ fly secrets set \
     ADMIN_EMAIL=<your email> \
     ADMIN_PASSWORD=<your password>
   ```

5. Create a fly volume in your preferred region:

   ```bash
   $ fly volumes create directus -s 10 -r sjc
   
           ID: vol_12345678asdf
         Name: directus
          App: your-app-name
       Region: sjc
         Zone: f46b
      Size GB: 10

    Encrypted: true
   Created at: 31 Dec 22 21:27 UTC
   ```

6. Deploy

   ```bash
   $ fly deploy
   
   ==> Verifying app config
   --> Verified app config
   ==> Building image
   ...
   ```

## How it works

This app runs Directus backed by sqlite using [Litefs](https://github.com/superfly/litefs) for global replication. The app is deployed as a Docker container.
