#!/bin/bash
if [ -z "$1" ] || [ "$1" = "all" ]; then
  for dir in infra/pocketid infra/caddy apps/gitea apps/wikijs apps/code-server; do
    echo "Status for $dir:"
    (cd $dir && docker compose ps)
    echo ""
  done
else
  echo "Status for $1:"
  (cd $1 && docker compose ps)
fi
