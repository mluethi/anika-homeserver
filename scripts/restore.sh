#!/bin/bash
if [ -z "$1" ]; then
  echo "Bitte gib den Backup-Ordner an, z. B.: ./scripts/restore.sh backup_20250719_103000"
  exit 1
fi

BACKUP_DIR="$1"

if [ ! -d "$BACKUP_DIR" ]; then
  echo "Ordner '$BACKUP_DIR' nicht gefunden!"
  exit 1
fi

echo "Stelle Backup aus $BACKUP_DIR wieder her..."

docker run --rm -v gitea_data:/volume -v "$PWD/$BACKUP_DIR":/backup alpine sh -c "rm -rf /volume/* && tar xzf /backup/gitea_data.tar.gz -C /volume"
docker run --rm -v wikijs_data:/volume -v "$PWD/$BACKUP_DIR":/backup alpine sh -c "rm -rf /volume/* && tar xzf /backup/wikijs_data.tar.gz -C /volume"
docker run --rm -v code_data:/volume -v "$PWD/$BACKUP_DIR":/backup alpine sh -c "rm -rf /volume/* && tar xzf /backup/code_data.tar.gz -C /volume"
docker run --rm -v caddy_data:/volume -v "$PWD/$BACKUP_DIR":/backup alpine sh -c "rm -rf /volume/* && tar xzf /backup/caddy_data.tar.gz -C /volume"
docker run --rm -v caddy_config:/volume -v "$PWD/$BACKUP_DIR":/backup alpine sh -c "rm -rf /volume/* && tar xzf /backup/caddy_config.tar.gz -C /volume"

echo "Wiederherstellung abgeschlossen."
