ARG BUILD_FROM=docker.io/triliumnext/trilium:v0.107.0
FROM ${BUILD_FROM}

ARG BUILD_VERSION
ARG BUILD_ARCH

# Set shell
SHELL ["/bin/sh", "-c"]

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

# Home Assistant requires these labels
LABEL \
    io.hass.name="TriliumNext Notes" \
    io.hass.description="Hierarchical note-taking application" \
    io.hass.version="${BUILD_VERSION}" \
    io.hass.type="addon" \
    io.hass.arch="${BUILD_ARCH}"

# Expose the port
EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s \
  CMD sh /usr/src/app/docker_healthcheck.sh || exit 1

# Set entrypoint
ENTRYPOINT ["/run.sh"]
