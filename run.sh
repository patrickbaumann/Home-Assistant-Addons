#!/bin/sh
set -e

# Ensure data directory exists with proper permissions
mkdir -p /home/node/trilium-data
chown -R node:node /home/node/trilium-data
chmod -R 755 /home/node/trilium-data

if [ ! -w "/home/node/trilium-data" ]; then
  echo "ERROR: Data directory is not writable. Check permissions."
  exit 1
fi

echo "Starting Trilium Next..."
echo "Web interface available at: http://$(hostname):8080"

# Use the known app path
APP_DIR="/usr/src/app"

# Important for Home Assistant Ingress
export TRILIUM_BASE_URL="/api/hassio_ingress/${HOSTNAME}"
export TRILIUM_ROOT_PATH="${TRILIUM_BASE_URL}"

# Change to app directory and start with proper host binding
cd "$APP_DIR" || { echo "ERROR: Application directory not found"; exit 1; }
echo "Starting Trilium with ingress configuration..."
exec su -s /bin/sh -c "node src/main --host 0.0.0.0 --port 8080" node