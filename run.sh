#! /bin/bash

mkdir -p /data/directus/uploads
mkdir -p /data/directus/extensions
mkdir -p /data/directus/database
chown -R node:node /data/directus

npx directus bootstrap
npx directus start