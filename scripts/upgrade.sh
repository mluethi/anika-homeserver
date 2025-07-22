#!/bin/bash
if [ -z "$1" ] || [ "$1" = "all" ]; then
  for dir in infra/pocketid infra/caddy apps/gitea apps/wikijs apps/code-server; do
    echo "Upgrading $dir..."
    (cd $dir && docker compose pull && docker compose up -d)
  done
else
  echo "Upgrading $1..."
  (cd $1 && docker compose pull && docker compose up -d)
fi
