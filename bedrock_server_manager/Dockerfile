ARG BUILD_FROM
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install runtime dependencies
RUN apk add --no-cache libcurl mariadb-client

# Install build dependencies, then bedrock-server-manager with db extras, then remove build deps
RUN apk add --no-cache --virtual .build-deps gcc musl-dev linux-headers python3-dev pkgconf && \
    pip install "bedrock-server-manager[mysql,mariadb,postgresql]" && \
    apk del .build-deps

# Copy run.sh
COPY run.sh /
RUN chmod a+x /run.sh

# Start server
CMD [ "/run.sh" ]
