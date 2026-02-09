#!/usr/bin/with-contenv bashio

SESSION_NAME="claude"
SESSION_COMMAND="claude"
WORK_DIR="/config/claude"

# Check if session exists
if ! tmux has-session -t "${SESSION_NAME}" 2>/dev/null; then
    bashio::log.info "Session ${SESSION_NAME} not found. Creating..."

    # Ensure we are in the right directory
    if [ -d "${WORK_DIR}" ]; then
        cd "${WORK_DIR}" || true
    else
        bashio::log.warning "Directory ${WORK_DIR} does not exist. Using current directory."
    fi

    # Create the session detached
    # -d: detached
    # -s: session name
    tmux new-session -d -s "${SESSION_NAME}" "${SESSION_COMMAND}"

    if [ $? -eq 0 ]; then
        bashio::log.info "Created tmux session: ${SESSION_NAME}"
    else
        bashio::log.error "Failed to create tmux session: ${SESSION_NAME}"
        exit 1
    fi
fi

# Attach to the session
# -d: detach any other clients attached to this session
bashio::log.info "Attaching to session: ${SESSION_NAME}"
exec tmux attach-session -d -t "${SESSION_NAME}"
