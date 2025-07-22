#!/bin/bash
if [ -z "$1" ] || [ "$1" = "all" ]; then
  for dir in infra/pocketid infra/caddy apps/gitea apps/wikijs apps/code-server; do
    echo "Restarting $dir..."
    (cd $dir && docker compose restart)
  done
else
  echo "Restarting $1..."
  (cd $1 && docker compose restart)
fi
