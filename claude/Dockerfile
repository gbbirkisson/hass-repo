ARG BUILD_FROM
FROM $BUILD_FROM

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    bash \
    ca-certificates \
    curl \
    git \
    nodejs \
    npm \
    tmux \

    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcairo2 \
    libcups2 \
    libgbm1 \
    libglib2.0-0 \
    libnspr4 \
    libnss3 \
    libpango-1.0-0 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxkbcommon0 \
    libxrandr2 \

    && rm -rf /var/lib/apt/lists/*

COPY --from=ghcr.io/astral-sh/uv:0.10.0 /uv /uvx /usr/local/bin/
COPY --from=tsl0922/ttyd:1.7.7-alpine /usr/bin/ttyd /usr/local/bin/ttyd

# Install claude
ARG CLAUDE_VERSION
RUN curl -fsSL https://claude.ai/install.sh -o /tmp/install-claude.sh && \
    chmod +x /tmp/install-claude.sh && \
    /tmp/install-claude.sh ${CLAUDE_VERSION} && \
    rm /tmp/install-claude.sh

# Set HOME to /data for runtime persistence
ENV HOME=/data
ENV PATH="/data/.local/bin:$PATH"

# Copy rootfs
COPY rootfs /
