ARG BUILD_FROM
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install bedrock-server-manager
RUN pip install bedrock-server-manager

# Copy run.sh
COPY run.sh /
RUN chmod a+x /run.sh

# Start server
CMD [ "/run.sh" ]
