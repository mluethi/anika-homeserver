#!/bin/bash
echo "Creating Docker network 'anika'..."
docker network create anika 2>/dev/null || echo "Network already exists."

echo "Ensuring script permissions..."
chmod +x scripts/*.sh

echo "Setup ready. You can now run: ./scripts/up.sh"
