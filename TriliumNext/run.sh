#!/bin/sh
set -e

# Ensure data directory exists with proper permissions
mkdir -p /home/node/trilium-data
chown -R node:node /home/node/trilium-data
chmod -R 755 /home/node/trilium-data

echo "Starting Trilium Next..."
echo "Web interface available at: http://$(hostname):8080"

# Use the known app path
APP_DIR="/usr/src/app"

# Enable verbose logging for debugging
export TRILIUM_LOG_LEVEL="debug"

# Important for Home Assistant Ingress
export TRILIUM_BASE_URL="/api/hassio_ingress/${HOSTNAME}"
export TRILIUM_ROOT_PATH="${TRILIUM_BASE_URL}"

# Check for Trilium data directory
if [ ! -f "/home/node/trilium-data/config.ini" ]; then
  echo "Initializing Trilium data directory..."
  # Create initial structure if needed, using simple sh syntax
  : # No-op for placeholder
fi

echo "Umgebungsvariablen:"
printenv

# Change to app directory and start with proper host binding
cd "$APP_DIR"
echo "Starting Trilium with ingress configuration..."
exec su -s /bin/sh -c "node src/main --host 0.0.0.0 --port 8080" node

