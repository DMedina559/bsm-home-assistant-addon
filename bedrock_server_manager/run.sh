#!/usr/bin/with-contenv bashio

# Create parent config directory
mkdir -p /root/.config

# Create data directories
mkdir -p /data/bsm_config
mkdir -p /data/bsm_data

# Create symlinks
ln -sfn /data/bsm_config /root/.config/bedrock-server-manager
ln -sfn /data/bsm_data /root/bedrock-server-manager

# Read options and export them as environment variables
export HOST=$(bashio::config 'HOST')
export PORT=$(bashio::config 'PORT')

bashio::log.info "Starting Bedrock Server Manager Web UI on ${HOST}:${PORT}..."

# Start the web server
exec bedrock-server-manager web start --host "${HOST}" --port "${PORT}"
