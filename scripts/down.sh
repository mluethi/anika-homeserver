#!/bin/bash
if [ -z "$1" ] || [ "$1" = "all" ]; then
  for dir in apps/code-server apps/wikijs apps/gitea infra/caddy infra/pocketid; do
    echo "Stopping $dir..."
    (cd $dir && docker compose down)
  done
else
  echo "Stopping $1..."
  (cd $1 && docker compose down)
fi
