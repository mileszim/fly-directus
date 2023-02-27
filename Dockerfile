FROM directus/directus:latest

USER root

# Copy LiteFS and set it up
COPY --from=flyio/litefs:pr-277 /usr/local/bin/litefs /usr/local/bin/litefs
ADD etc/litefs.yml /etc/litefs.yml
ADD etc/fuse.conf /etc/fuse.conf

# Setup our environment to include FUSE & SQLite.
RUN apk add \
  bash \
  fuse3 \
  sqlite \
  libspatialite \
  && ln -s /usr/lib/mod_spatialite.so.7 /usr/lib/mod_spatialite.so

# Set up out app
ADD run.sh /etc/run.sh
RUN chmod +x /etc/run.sh

# USER node

# Run LiteFS as the entrypoint
CMD ["litefs", "mount"]
