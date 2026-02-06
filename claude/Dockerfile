ARG BUILD_FROM
FROM $BUILD_FROM

# Build arguments provided by build.yaml
ARG CLAUDE_VERSION
ARG TTYD_VERSION
ARG UV_VERSION

# Install system dependencies
RUN apk add --no-cache \
    curl \
    tmux \
    bash \
    nodejs \
    npm \
    git

COPY --from=ghcr.io/astral-sh/uv:0.10.0 /uv /uvx /usr/local/bin/
COPY --from=tsl0922/ttyd:1.7.7-alpine /usr/bin/ttyd /usr/local/bin/ttyd

# Install claude
RUN curl -fsSL https://claude.ai/install.sh -o /tmp/install-claude.sh && \
    chmod +x /tmp/install-claude.sh && \
    /tmp/install-claude.sh ${CLAUDE_VERSION} && \
    rm /tmp/install-claude.sh

# Set HOME to /data for runtime persistence
ENV HOME=/data
ENV PATH="/data/.local/bin:$PATH"

# Copy rootfs
COPY rootfs /
