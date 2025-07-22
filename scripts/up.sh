#!/bin/bash
docker network create anika 2>/dev/null || true

if [ -z "$1" ] || [ "$1" = "all" ]; then
  for dir in infra/pocketid infra/caddy apps/gitea apps/wikijs apps/code-server; do
    echo "Starting $dir..."
    (cd $dir && docker compose up -d)
  done
else
  echo "Starting $1..."
  (cd $1 && docker compose up -d)
fi
