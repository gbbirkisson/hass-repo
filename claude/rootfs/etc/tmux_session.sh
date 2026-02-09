#!/usr/bin/env bash

SESSION_NAME="claude"
SESSION_COMMAND="claude"
WORK_DIR="/config/claude"

# Check if session exists
if ! tmux has-session -t "${SESSION_NAME}" 2>/dev/null; then
    # Ensure we are in the right directory
    if [ -d "${WORK_DIR}" ]; then
        cd "${WORK_DIR}" || true
    fi

    # Create the session detached
    # -d: detached
    # -s: session name
    tmux new-session -d -s "${SESSION_NAME}" "${SESSION_COMMAND}"
fi

# Attach to the session
# -d: detach any other clients attached to this session
exec tmux attach-session -d -t "${SESSION_NAME}"
