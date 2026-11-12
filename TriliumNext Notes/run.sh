#!/bin/sh
set -e

DATA_DIR="${TRILIUM_DATA_DIR:-/home/node/trilium-data}"

echo "Starting TriliumNext Notes..."
echo "Web interface available at: http://$(hostname):8080"

# Use the known app path
APP_DIR="/usr/src/app"

# Important for Home Assistant Ingress
export TRILIUM_BASE_URL="/api/hassio_ingress/${HOSTNAME:-$(hostname)}"
export TRILIUM_ROOT_PATH="${TRILIUM_BASE_URL}"

# Change to app directory and start with proper host binding
cd "$APP_DIR"
echo "Starting TriliumNext Notes with ingress configuration..."

# Without root (`--user`, Kubernetes `runAsNonRoot`, rootless Podman) the container can neither
# remap `node` nor change ownership, so Trilium runs as the user it was started with.
if [ "$(id -u)" != "0" ]; then
    mkdir -p "$DATA_DIR"
    if [ -n "${USER_UID:-}${USER_GID:-}" ]; then
        echo "Running as $(id -u):$(id -g), so USER_UID and USER_GID are ignored; set the user with --user instead"
    fi
    exec node ./main.mjs
fi

# Ensure data directory exists
mkdir -p "$DATA_DIR"

if [ -n "${USER_UID:-}" ]; then
    usermod -o -u "${USER_UID}" node
else
    echo "No USER_UID specified, leaving 1000"
fi

if [ -n "${USER_GID:-}" ]; then
    groupmod -o -g "${USER_GID}" node
else
    echo "No USER_GID specified, leaving 1000"
fi

chown -R node:node /home/node
case "$DATA_DIR" in
    /home/node|/home/node/*) ;;
    *) chown -R node:node "$DATA_DIR" ;;
esac
chmod u+rwx "$DATA_DIR"

exec su -c "node ./main.mjs" node
