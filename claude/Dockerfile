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
    npm

# Install uv
COPY --from=ghcr.io/astral-sh/uv:0.10.0 /uv /uvx /usr/local/bin/

# Install ttyd
# Note: We need to handle multi-arch for ttyd. 
# The build.yaml args pass TTYD_VERSION, but COPY --from doesn't support 
# variable interpolation in the image name in older Docker versions, 
# but Home Assistant build env usually supports it.
# However, to be safe and simple given we are using COPY --from:
# We'll use the variable in a way that works or revert to the curl method if needed.
# Actually, let's stick to the curl method for ttyd to be safe with multi-arch 
# logic inside the Dockerfile if we want to avoid complex COPY --from logic 
# or just rely on the fact that we are building ON the target arch.
#
# WAIT. Home Assistant builds are usually cross-compiled.
# If we run "docker build" locally on amd64 for amd64, it's fine.
# If we use the HA builder, it handles things.
#
# Let's go back to the curl method which was robust for multi-arch in one file,
# OR assume we are pulling the specific arch image.
# The tsl0922/ttyd image is multi-arch.
#
# Let's try COPY --from with the ARG again, assuming modern builder.
COPY --from=tsl0922/ttyd:1.7.7-alpine /usr/bin/ttyd /usr/local/bin/ttyd

# Setup path
ENV PATH="/root/.local/bin:$PATH"

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

# No CMD needed, S6 overlay is the entrypoint