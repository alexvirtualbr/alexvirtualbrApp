#!/bin/bash
set -e

# Remove a pontentially pre-existing server.pid for Rails.
rm -f /alexvirtualbrApp/tmp/pids/server.pid

# Then exec the container's mais process (what's set as CMD in the Dockerfile)
exec "$@"