#!/bin/sh
set -e

# Ensure data directory exists with proper permissions
mkdir -p /home/node/trilium-data
chown -R node:node /home/node/trilium-data
chmod -R 755 /home/node/trilium-data

echo "Starting TriliumNext Notes..."
echo "Web interface available at: http://$(hostname):8080"

# Use the known app path
APP_DIR="/usr/src/app"

# Important for Home Assistant Ingress
export TRILIUM_BASE_URL="/api/hassio_ingress/${HOSTNAME}"
export TRILIUM_ROOT_PATH="${TRILIUM_BASE_URL}"

# Change to app directory and start with proper host binding
cd "$APP_DIR"
echo "Starting TriliumNext Notes with ingress configuration..."
[ ! -z "${USER_UID}" ] && usermod -u ${USER_UID} node || echo "No USER_UID specified, leaving 1000"
[ ! -z "${USER_GID}" ] && groupmod -og ${USER_GID} node || echo "No USER_GID specified, leaving 1000"

chown -R node:node /home/node
exec su -c "node ./main.cjs" node
