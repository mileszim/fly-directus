FROM flyio/litefs:main AS litefs
FROM directus/directus:latest

COPY --from=litefs /usr/local/bin/litefs /usr/local/bin/litefs

USER root

# Copy our LiteFS configuration.
ADD etc/litefs.yml /etc/litefs.yml
ADD etc/fuse.conf /etc/fuse.conf
ADD run.sh /etc/run.sh

# Setup our environment to include FUSE & SQLite.
RUN apk add \
  bash \
  fuse \
  sqlite \
  libspatialite \
  && ln -s /usr/lib/mod_spatialite.so.7 /usr/lib/mod_spatialite.so
RUN chmod +x /etc/run.sh

# USER node

# Run LiteFS as the entrypoint
CMD ["litefs", "mount"]
