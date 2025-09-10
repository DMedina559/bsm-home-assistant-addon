#!/usr/bin/with-contenv bashio

CONFIG_DIR="/data/bsm_config"
CONFIG_FILE="${CONFIG_DIR}/bedrock_server_manager.json"
DATA_DIR="/data/bsm_data"

# Create persistent directories
mkdir -p "${CONFIG_DIR}"
mkdir -p "${DATA_DIR}"

# Create symlinks
mkdir -p /root/.config
ln -sfn "${CONFIG_DIR}" /root/.config/bedrock-server-manager
ln -sfn "${DATA_DIR}" /root/bedrock-server-manager

# Check if config file exists, if not create it
if ! bashio::fs.file_exists "${CONFIG_FILE}"; then
    bashio::log.info "Configuration file not found, creating default."
    cat > "${CONFIG_FILE}" << EOL
{
  "data_dir": "/root/bedrock-server-manager",
  "db_url": "sqlite:////root/bedrock-server-manager/bedrock_server_manager.db"
}
EOL
fi

# Read options and export them as environment variables
export HOST
HOST=$(bashio::config 'HOST')
export PORT
PORT=$(bashio::config 'PORT')

bashio::log.info "Starting Bedrock Server Manager Web UI on ${HOST}:${PORT}..."

# Start the web server
exec bedrock-server-manager web start --host "${HOST}" --port "${PORT}"
