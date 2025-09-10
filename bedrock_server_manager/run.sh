#!/usr/bin/with-contenv bashio

export HOST=$(bashio::config 'HOST')
export PORT=$(bashio::config 'PORT')

bashio::log.info "Starting Bedrock Server Manager Web UI on ${HOST}:${PORT}..."

exec bedrock-server-manager web start --host "${HOST}" --port "${PORT}"
