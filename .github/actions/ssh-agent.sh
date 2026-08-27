#!/bin/bash
set -e

# Start SSH agent
eval "$(ssh-agent -s)"

# Add SSH key from environment variable
echo "$SSH_PRIVATE_KEY" | ssh-add -

# Export socket for subsequent steps
echo "SSH_AUTH_SOCK=$SSH_AUTH_SOCK" >> $GITHUB_ENV
echo "SSH_AGENT_PID=$SSH_AGENT_PID" >> $GITHUB_ENV