ARG BUILD_FROM
FROM ${BUILD_FROM}

# Install bash if needed (uncomment if you want bash available)

# Set shell
SHELL ["/bin/sh", "-c"]

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

# Set proper permissions
RUN mkdir -p /home/node/trilium-data && \
    chown -R node:node /home/node/trilium-data && \
    chmod -R 755 /home/node/trilium-data

# Home Assistant requires this labels
LABEL \
    io.hass.name="Trilium Notes" \
    io.hass.description="Hierarchical note-taking application" \
    io.hass.version="${BUILD_VERSION}" \
    io.hass.type="addon" \
    io.hass.arch="${BUILD_ARCH}"

# Expose the port
EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s \
  CMD wget --quiet --tries=1 --spider http://localhost:8080/ || exit 1

# Set entrypoint
ENTRYPOINT ["/run.sh"]